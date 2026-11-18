-- Threat: SoftwareBundler:Win32/Mizenota
-- Type: 13
-- MpAttributes: STATIC:SoftwareBundler:Win32/MizenotaPWComment

local l_0_0 = mp.getfilename()
if l_0_0:len() < 6 then
  return mp.CLEAN
end
if string.sub(l_0_0, -5) ~= "->CMT" then
  return mp.CLEAN
end
local l_0_1 = mp.get_parent_filehandle()
if mp.is_handle_nil(l_0_1) then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile_by_handle(l_0_1, 0, 7)
if l_0_2 ~= "Rar!\026\a\000" then
  return mp.CLEAN
end
return mp.INFECTED
