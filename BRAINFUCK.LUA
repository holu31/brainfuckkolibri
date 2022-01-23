function list_len(t)
	local len = 0
	for _,_ in pairs(t) do
		len = len + 1
	end
	return len
end

--init global variables
result="" --code result
code=""
chars = {" ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
chars_pos = {0};
data = 1;
--here we draw window
function drawwin()
--begin redraw
paintstart()
--define window
window(10,10,200,200,65069280)
--print title
textout(3,13,0,"BrainFuck")
--print result
textout(6, 30, 0, "Result:")
textout(50, 30, 0, result)

--print code
textout(6, 40, 0, "Code:")
textout(37, 40, 0, code)

--then we need make buttons and print labels of buttons
makebutton(6,60,20,20,10,13619151)
textout(9,63,0,"+")
makebutton(36,60,20,20,11,13619151)
textout(39,63,0,"-")
makebutton(66,60,20,20,12,13619151)
textout(69,63,0,"<")
makebutton(96,60,20,20,13,13619151)
textout(99,63,0,">")
makebutton(126,60,20,20,14,13619151)
textout(129,63,0,".")

--and finish redraw
paintend()
end


--main loop
while 1==1 do --loop until exit
	event=waitevent() --check the event
	if event==1 then drawwin() end --redraw needed
	if event==2 then key=getkey()  end --get keyboard scancode
	if event==3 then button=getbutton() --button pressed
		if button==1 then sysexit() end --close button
		if button==10 then
			code = code .. "+"
			chars_pos[data] = chars_pos[data] + 1
		end
		if button==11 then
			chars_pos[data] = chars_pos[data] - 1
			code = code .. "-"
		end
		if button==12 then
			data = data - 1
			code = code .. "<"
		end
		if button==13 then
			data = data + 1
			if not chars_pos[data] then chars_pos[data] = 0 end
			code = code .. ">"
		end
		if button==14 then
			code = code .. "."
			result = result .. chars[chars_pos[data]]
		end
		drawwin() --redraw... we need it after pressing buttons
	end
end
