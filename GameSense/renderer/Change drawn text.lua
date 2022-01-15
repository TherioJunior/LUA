--| Usage Tutorial:
--| Step 1: Insert text strings into the Replace table as written in the given format.
--| Step 2: Paste this at the top of the LUA you want to manipulate.

--| Backing up variables
local o_text = renderer.text;

--| Creating new variables
local Replace = {
 ["drawn text"] = "spoofed"
};

--| Hook renderer.text
renderer.text = function (x, y, r, g, b, a, flags, max_width, ...)
 --| Spoofing the string values
 local DrawnText = {...};
 DrawnText[1] = Replace[DrawnText[1]] or DrawnText[1];

 --| Drawing the spoofed or unspoofed text
 return o_text (x, y, r, g, b, a, flags, max_width, unpack(DrawnText));
end
