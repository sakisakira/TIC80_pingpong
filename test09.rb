# title:   pingpong exercise
# author:  sakira
# desc:    short description
# site:    website link
# license: MIT License (change this to your license of choice)
# version: 0.1
# script:  ruby

$t=0
$x=96
$y=24
$tic=0

Width=240
Height=136
ActDur=50

TableWidth=1.525 # in meter.
TableDepth=2.74 # in meter
Gravity=9.8 # in m/s^2

def draw_table
	t_w=120;t_h=36;col=8
	x0=Width/2-t_w/2
	y0=Height-t_h
	rect(x0,y0,t_w,t_h,col)
	tri(x0,y0,0,Height,x0,Height,col)
	x1=Width/2+t_w/2
	y1=y0
	tri(x1,y1,Width,Height,x1,Height,col)
end

def draw_net
	n_w=Width;n_h=18;blue=10;white=14
	s_w=4
	x0=Width/2-n_w/2
	x1=Width/2+n_w/2
	y0=Height-n_h
	y1=Height
	(n_w/s_w).times do |x_|
		x=x_*s_w+2
		line(x,y0,x,y1,blue)
	end
	(n_h/s_w).times do |y_|
		y=y0+y_*s_w+2
		line(x0,y,x1,y,blue)
	end
	rect(x0,y0,n_w,2,white)
end

def draw_ball
	white=14
	circ(80,110,5,white)
	elli(80,120,6,2,7)
end

def TIC
	$y-=1 if btn 0
	$y+=1 if btn 1
	$x-=1 if btn 2
	$x+=1 if btn 3
	
	fsidx=($tic%ActDur)/8
	fsidx=2 if fsidx>2
	bsidx=($tic%ActDur)/5
	bsidx=7 if bsidx>7

	cls(1)
	
	# draw head
	spr(256+fsidx*4,$x+16,$y+1,0,1,0,0,4,4)
	
	# draw body
	if bsidx<4 then
		bsidx_=bsidx*4
	else
	bsidx_=bsidx*4+48
	end
	spr(bsidx_,$x,$y,0,2,0,0,4,4)

	print("Yeah!",$x,$y-10)
	$t+=1
	print("Score: 003200",5,1,12)
	print("Time: 02:29",180,1,12)
	
	draw_table
	draw_ball
	draw_net
	
	$tic+=1
end

# <TILES>
# 017:0000000000000000000000000000000000000000000000000000000000000077
# 018:000000000000000000000000000000000000000000000000000000007bb00000
# 021:0000000000000000000000000000000000000000000000000000000000000077
# 022:0000000000000000000000000000000000000000000000000000000077b00000
# 025:0000000000000000000000000000000000000000000000000000000000000077
# 026:0000000000000000000000000000000000000000000000000000000077b00000
# 029:0000000000000000000000000000000000000000000000000000000000000077
# 030:00000000000000000000000000000000000000000000000000000000777b0000
# 032:0000000000000000000000000000000000000220000022220000222200000222
# 033:000007bb00007bbb00007bbb0007bbb90007bbb900022d9900022dd900222ddb
# 034:bbbb0000bbbb00009bbb00009bbbb0009bbb9b00bbbb9920bbbb9922bbbb9d22
# 037:000007bb00007bbb00007bb900007bb900007bb9000022220000222200000222
# 038:bbbb0000bbbb0000bbbb0000bbbbb000bbbb9b00bbbb9b00bbbb9900bbbb9200
# 041:000007bb000007bb000007bb000007bb000007bb000002dd0000022200055222
# 042:bbbb0000bbbb0000bbbb00009bbbb0009bbbbb00dbbb9b00dbbb9900dbbb9000
# 044:0000000000000000000000000000000000000000000000000000000500000055
# 045:000000bb000007bb000007bb000007bb000007bb000007bb5550099b555522bb
# 046:bbbbb000b7bb9000b7bb9000b7bb9000b7bb9000bddd0000b22dd000bb22d000
# 048:0000002200000022000000020000000000000000000000000000000000000000
# 049:222dd0bb22d000bbdd0000bb000000bb000000bb000000bb000007bb00007bbb
# 050:bbb90022bbb9022dbbb92dd0bbb9d000bbb90000bbb90000bbb90000bbb99000
# 052:0000000000000000000000020000000200000000000000000000000000000000
# 053:0000222d022222dd22222dbb2dddd0bb000000bb000000bb000007bb00007bbb
# 054:bbb92d00bbb9dd00bbb9dd00bbb9d000bbb90000bbb90000bbb90000bbb99000
# 057:00555522005555220055552d0005522d0000222d000022db000222bb00007bbb
# 058:dbbbd000dbbbd000bbb9d000bbb90000bbb90000bbb90000bbb90000bbb99000
# 060:0000005500000055000000000000000000000000000000000000000000000000
# 061:55552dbb555500bb555000bb000000b20000002200000022000007bb00007bbb
# 062:b222d000222d000022d990002db900002db990002bbb9000bbbb9000bbbb9000
# 081:0000000000000000000000000000000000000000000000000000000000000077
# 082:0000000000000000000000000000000000000000000000000000000077bb7000
# 084:0000000000000000000000000000000000000000000000000000555500005555
# 085:0000000000000000000000000000000000000000000000005000000050000077
# 086:00000000000000000000000000000000000000000000000000000000777b7000
# 088:0000000000000000000000000000000000000000000000000000000500000055
# 089:0000000000000000000000000000000000000000550000005550000055557777
# 090:0000000000000000000000000000000000000000000000000000000077bbbb00
# 093:0000000000000000000005550000555500005555000555550025555500225555
# 094:00000000000000005000000055000000550000005500000055000000777bbb00
# 096:0000000000055550000555550055555500555555000555550000055200000002
# 097:00000bbb00007bbb00007bbb00007b7b5000bb7b20000bbb222009bb22222bbb
# 098:bbbbb700bbbbbb70bbbbbb70bbb9bbbbbbb99bbbbbb99dddbb990d2dbbbb0d22
# 099:00000000000000000000000000000000000000000000000000000000d0000000
# 100:0000555500005555000055550000005500000022000000220000002200000022
# 101:500007bb50007bbb50007bbb0007bbb70007bbb7202dbbbb2022db9b2222dbbb
# 102:bbbbb700bbbbbb70bbbbbb70bbbb9bbbbbbb9bbbbbb99dddbb990d2dbbb90d22
# 103:00000000000000000000000000000000000000000000000000000000d0000000
# 104:0000005500000055000000550000002500000022000002220000022200000222
# 105:5555bbbb55557bbb55577bbb55b77bbb222dbbbb22d0bbb92dd0bb9bd000bbbb
# 106:bbbbbbb0bbbbbbb0bbbbbbb97bbb9bb97bbb9bb9bbbb0dddbbb90dd2bbbb00d2
# 107:0000000000000000000000000000000000000000000000002000000020000000
# 109:022227bb022d7bbb02d27bbb22d27bbb22d2bbbb2222bbb92dddbb9b0000bbbb
# 110:bbbbbbb0bbbbbbb0bbbb9bbb7bbb9bbb7bbb99bbbbbb0dddbbb90d22bbbb00d2
# 111:0000000000000000000000000000000000000000000000002000000020000000
# 113:02222bbb00dddbbb00000bbb00000bbb00000bbb00000bbb00000bbb00007bbb
# 114:bbbb0022bbbb0022bbbb022dbbbb22d0bbb22d00bbb22d00bbbb9000bbbb9000
# 115:d0000000d0000000000000000000000000000000000000000000000000000000
# 116:0000002200000002000000000000000000000000000000000000000000000000
# 117:222d0bbb2dd00bbb00000bbb00000bbb00000bbb00000bbb00000bbb00007bbb
# 118:bbbb0022bbbb0022bbbbb022bbbbb022bbbb9222bbbb9222bbbb9200bbbb9900
# 119:d0000000d0000000d0000000d0000000d0000000000000000000000000000000
# 121:0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb00007bbb0007bbbb007bbbbb
# 122:bbbb00d2bbbb00d2bbbb900dbbbb900dbbbb900dbbbb990dbbbbb902bbbbb900
# 123:2000000020000000200000002000000020000000220000002200000020000000
# 125:0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0007bbbb007bbbbb
# 126:bbbb000dbbbb000dbbbb900dbbbb9000bbbb9900bbbbb990bbbbbb90bbbbbb90
# 127:220000002200000022000000d2000000d2000000d20000002200000020000000
# </TILES>

# <SPRITES>
# 000:0000000000000000000000000000000000000000000000000000000400000004
# 001:0000000000000000000000000000000000444440444444444444444444444444
# 002:0000000000000000000000000000000004444444444444444444444444444444
# 003:0000000000000000000000000000000000000000440000004440000044440000
# 004:0000000000000000000000000000000000000000000000000000000400000004
# 005:0000000000000000000000000000000000444440444444444444444444444444
# 006:0000000000000000000000000000000004444444444444444444444444444444
# 007:0000000000000000000000000000000000000000440000004440000044440000
# 008:0000000000000000000000000000000000000000000000000000000400000004
# 009:0000000000000000000000000000000000444440444444444444444444444444
# 010:0000000000000000000000000000000004444444444444444444444444444444
# 011:0000000000000000000000000000000000000000440000004440000044440000
# 016:0000004400000444000004440000044c0000044c000004440000044c0000044c
# 017:4444444444444444c4444cc4c44ccccc44cc444cccccccc4cccccccccccccccc
# 018:4444444444444444444444444444444444444444c4444444c4444444cc444444
# 019:4444000044444000444440004444440044444400444444004444440044444400
# 020:000000440000044400000444000004440000044400000444000044440000444c
# 021:44444444444444444c444ccccc4cccccc44cccc44ccccccccccccccccccccccc
# 022:4444444444444444c4444444c444444444c44444cc4c4444cccc4444cccc4444
# 023:4444000044444000444440004444440044444400444444004444440044444400
# 024:0000004400000444000044440000444400004444000044440000444400004444
# 025:44444444444444444cc4444c4cc444cccc444cccc4cccccccccccccccccccccc
# 026:444444444ccccc44ccccccc4ccccccccccc4444cccccccc4cccccccccccccccc
# 027:44440000444440004444400044444400c4444400c4444400cc444400cc444400
# 029:00000000000000000000000000000000000000000000000000000000000000bb
# 030:00000000000000000000000000000000000000000000000000000000bbbbb000
# 032:0000000f0000000e0000000e0000000e000000070000000d0000000d0000000c
# 033:fcccfffc9ccce99c9ccce99cbcccebfcfccceffcdccccddddccccdddcccccccc
# 034:cc444444cc444444cc444444cc444444cc444444cc444444cc444444cc444444
# 035:4444444044444440444444404444444044444440444444004444440044444000
# 036:0000444c0000444c0000004400000044000000040000000d0000000d0000000c
# 037:fffccccfe99cccce799cccceebfcccceeffcccceddccccccdccccccccccccccc
# 038:fffc444499fc444499fc4444bffc4444fffc4444cddd4444cddd4444cccc4444
# 039:4444444044444440444444404444444044444440444444004444440044444000
# 040:0000444400004444000000440000004400000044000000440000004400000044
# 041:cffffcccce99fcccce99fccccebffccccefffcccdddcccccdddcccccdccccccc
# 042:ccccffffcccce99fcccce99fccccebffccccefffcccccccdcccccccdcccccccc
# 043:cc444440cc444440cc444440cc444440cc444440dd444400dd444400c4444000
# 044:0000000000033330000333330033333300333333000333330000033200000002
# 045:00000bbb0000bbbb0000bbbb0000bbbb3000bbbb20000bbb22200bbb22222bbb
# 046:bbbbbb00bbbbbbb0bbbbbbb0bbbbbbbbbbbbbbbbbbbbb222bbbb0222bbbb0222
# 047:0000000000000000000000000000000000000000000000000000000020000000
# 049:cccccccc0c666ccc00cccccc0044444d0004444c0004444c0000000c00000000
# 050:cc444444cc444444dd444444dd444444cc444444cc444444ccccc00000000000
# 051:4444400044444000444440004444400044440000440000000000000000000000
# 053:cccccccc4ccc666c44cccccc4444444d0444444c0044444c0000000c00000000
# 054:cccc4444cccc4444cddd4444dddd4444cccc4444cccc4444ccccc00000000000
# 055:4444400044444000444440004444400044440000440000000000000000000000
# 056:0000000400000000000000000000000000000000000000000000000000000000
# 057:4ccccccc44ccccc60444cccc0044444d0004444c0000444c0000000c00000000
# 058:cccccccc666cccc4cccccc44ddddd444ccccc444ccccc444ccccc00000000000
# 059:4444400044440000444400004440000044000000400000000000000000000000
# 061:02222bbb00222bbb00000bbb00000bbb00000bbb00000bbb00000bbb0000bbbb
# 062:bbbb0022bbbb0022bbbb0222bbbb2220bbb22200bbb22200bbbbb000bbbbb000
# 063:2000000020000000000000000000000000000000000000000000000000000000
# 064:0000000000000000000000000000000000000044000044440000444400044444
# 065:0000000000000000000000004444444444444444444444444444444444444444
# 066:0000000000000000000000004400000044440000444444004444444444444444
# 067:0000000000000000000000000000000000000000000000000440000004440000
# 080:0044444400444444004444440444444204444422044442240444222404442222
# 081:4444444444444444444444444442244444422222442222222222222222222222
# 082:4444444444444444444444442222444422222444222222442222222422222222
# 083:4444000044444000444440004444400044444400444444004444440044444400
# 096:0444222204442222044422220444422204444222044442260044422604444222
# 097:2522222225222222252222222522222222222222222222222222222222222222
# 098:2225222222252222222522222225222222222222222226222222262222222222
# 099:4244440042444440444444402444444024444440244444404444444044444440
# 112:0444422204440222044403220040002200000000000000000000000000000000
# 113:2222222226622222266666662222222222222222022222220000000000000000
# 114:2222222426222244662222402222244022220400220000000000000000000000
# 115:4444440044444440444444404440440044000000000000000000000000000000
# 119:0000000000000000000000040000000400000004000000040000000400004444
# 123:0000000000000000000000000000000400000004000000040000000400444444
# 127:0000000000000000000000000000000400000004000000040000000400044444
# 179:0000000000000000000000000000000000000004000000040000000400044444
# 243:0000000000000000000000000000000400000004000000040000000400044444
# </SPRITES>

# <WAVES>
# 000:00000000ffffffff00000000ffffffff
# 001:0123456789abcdeffedcba9876543210
# 002:0123456789abcdef0123456789abcdef
# </WAVES>

# <SFX>
# 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
# </SFX>

# <TRACKS>
# 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
# </TRACKS>

# <PALETTE>
# 000:1a1c2c6161aeffcab6e22024ba7128f24044d26528bed2ff29a524859dde41a6f673c6d6ffcab6faaa8df6ffff404440
# 001:08000000550000814cff0000000000000000000000000000000000000000000000000000000000000000000000000000
# </PALETTE>

