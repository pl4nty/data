-- Threat: SoftwareBundler:Win32/Mizenota
-- Type: 13
-- MpAttributes: STATIC:SoftwareBundler:Win32/MizenotaPWFile

local l_0_0 = mp.getfilename()
local l_0_1 = l_0_0:len()
local l_0_2 = false
if 16 < l_0_1 and string.sub(l_0_0, -16) == "->Enter 1234.txt" or 14 < l_0_1 and string.sub(l_0_0, -14) == "->Use_1234.txt" or 14 < l_0_1 and string.sub(l_0_0, -14) == "->Use 1234.txt" or 26 < l_0_1 and string.sub(l_0_0, -26) == "->USE PASSWORD - 12345.txt" or 17 < l_0_1 and string.sub(l_0_0, -17) == "->Use 1 2 3 4.txt" or 21 < l_0_1 and string.sub(l_0_0, -21) == "->Password = 1234.txt" or 23 < l_0_1 and string.sub(l_0_0, -23) == "->you should write 1234" or 32 < l_0_1 and string.sub(l_0_0, -32) == "->1234 is what should be written" or 13 < l_0_1 and string.sub(l_0_0, -13) == "->key is 1234" or 18 < l_0_1 and string.sub(l_0_0, -18) == "->1234 for opening" or 15 < l_0_1 and string.sub(l_0_0, -15) == "->to unzip 1234" or 21 < l_0_1 and string.sub(l_0_0, -21) == "->1234 for extracting" or 13 < l_0_1 and string.sub(l_0_0, -13) == "->to run 1234" or 24 < l_0_1 and string.sub(l_0_0, -24) == "->Password is-  1234.txt" or 25 < l_0_1 and string.sub(l_0_0, -25) == "->Password is -  1234.txt" then
  l_0_2 = true
end
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.get_parent_filehandle()
if mp.is_handle_nil(l_0_3) then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_4 = mp.readfile_by_handle(l_0_3, 0, 6)
if l_0_4 == "7z\188\175'\028" or l_0_4 == "Rar!\026\a" or mp.readu_u32(l_0_4, 1) == 67324752 then
  return mp.INFECTED
end
return mp.CLEAN
