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

# We assume BPP=2 from here.

SpriteSize = [16, 8]
def sprite2line(s_x, s_y, indices, width, height)
    line = ""
    SpriteSize[1].times do |ly|
        y = s_y * SpriteSize[1] + ly
        (SpriteSize[0] / 2).times do |lx|
            x = s_x * SpriteSize[0] + lx * 2
            if x >= width or y >= height then
                char = "0"
            else
                index = y * width + x
                i0 = indices[index]
                i1 = indices[index + 1]
                char = (i1.to_s + i0.to_s).to_i(4).to_s(16)
            end
            line += char
        end
    end
    line
end

SpriteCounts = [16, 16] # At most 16 x 16 = 256 sprites.
SpriteCounts[1].times do |s_y|
    SpriteCounts[0].times do |s_x|
        body = sprite2line(s_x, s_y, indices, width, height)
        break if body == "0" * 64
        sp_i = s_y * SpriteCounts[0] + s_x
        print ("000" + sp_i.to_s)[-3, 3]
        print ":"
        print body
        print "\n"
    end
end
