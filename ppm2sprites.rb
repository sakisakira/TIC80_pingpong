#!/usr/bin/env ruby

if ARGV.length != 1 then
    print "Usage: ", __FILE__, " ppm_filename", "\n"
    exit
end
filename = ARGV[0]

lines = IO.readlines(filename)
lines.delete_if {|l| /^\#/ =~ l}

if lines.length < 5 or /^P3/i !~ lines[0] then
    print "This file does not seem to a valid ASCII PPM file.\n"
    exit
end

digits = lines[1 ..].join(" ").split(/\s/)
    .select {|i| !i.empty?}.map {|str| str.to_i}
width = digits[0]
height = digits[1]
max_d = digits[2] # It will be ignored in this script.

print "width:", width, " height:", height, "\n"

body = digits[3 ..]
if body.length < width * height * 3 then
    print "This file does not contain enought pixel array.\n"
    exit
end

class Rgb
    attr_accessor :r, :g, :b
    @@instances = []

    def initialize(r, g, b)
        @r = r
        @g = g
        @b = b
        if not @@instances.include?(self) then
            @@instances << self
        end
    end

    def ==(other)
        @r == other.r and 
        @g == other.g and
        @b == other.b
    end
    
    def index
        @@instances.index(self)
    end
end

pixels = []
(width * height).times do |i|
    rgb = Rgb.new(body[i*3], body[i*3 + 1], body[i*3 + 2])
    pixels << rgb
end

indices = pixels.map {|rgb| rgb.index}

if indices.max > 3 then
    print "BPP=4 sprites can be imported by PNG, so this script is not required.\n"
    exit
end

# We assume BPP=2.

TWidth = 256 # It is width of BPP=2 sprites of TIC-80.
height.times do |y_i|
    line = ""
    ([width, TWidth].min / 2).times do |x_i|
        index = y_i * width + x_i * 2
        i0 = indices[index]
        i1 = indices[index + 1]
        char = (i1.to_s + i0.to_s).to_i(4).to_s(16)
        line += char
    end
    print line
    print "0" * (TWidth / 2 - line.length), "\n"
end
