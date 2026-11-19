-- Threat: !InfrastructureShared
-- Name: !#Lua:IOAVISOFile
-- Type: 13
-- MpAttributes: RPF:AnyFileHasIOAVURL

local l_0_0 = true
local l_0_1 = mp.getfilesize()
local l_0_2 = 201326592
if not mp.get_mpattribute("RPF:TopLevelFile") then
  l_0_0 = false
  l_0_2 = 12582912
end
if l_0_1 < 33792 or l_0_1 > l_0_2 then
  return mp.CLEAN
end
if mp.bitand(l_0_1, 2047) ~= 0 then
  return mp.CLEAN
end
local l_0_3 = string.lower(mp.getfilename())
if string.sub(l_0_3, -4) ~= ".iso" and string.sub(l_0_3, -4) ~= ".img" then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_4 = mp.readfile(32768, 16)
if l_0_4:find("\001CD001\001", 1, true) == 1 then
  if l_0_0 then
    mp.set_mpattribute("Lua:IOAVTopLevelISOFile")
    mp.set_mpattribute("//Lua:GIOAVTopLevelISOFile")
  elseif not mp.get_mpattribute("//Lua:GIOAVFirstISOFileInContainer") then
    mp.set_mpattribute("Lua:IOAVFirstISOFileInContainer")
    mp.set_mpattribute("//Lua:GIOAVFirstISOFileInContainer")
  end
elseif l_0_4:find("\000BEA01\001", 1, true) == 1 then
  if l_0_0 then
    mp.set_mpattribute("Lua:IOAVTopLevelUDFFile")
    mp.set_mpattribute("//Lua:GIOAVTopLevelUDFFile")
  elseif not mp.get_mpattribute("//Lua:GIOAVFirstUDFFileInContainer") then
    mp.set_mpattribute("Lua:IOAVFirstUDFFileInContainer")
    mp.set_mpattribute("//Lua:GIOAVFirstUDFFileInContainer")
  end
end
return mp.CLEAN
