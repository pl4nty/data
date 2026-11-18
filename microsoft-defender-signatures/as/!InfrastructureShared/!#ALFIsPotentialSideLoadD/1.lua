-- Threat: !InfrastructureShared
-- Name: !#ALF:IsPotentialSideLoad.D
-- Type: 10
-- MpAttributes: pea_isdll & pea_hasexports & Lua:TopLevelUnsigned

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "c:\\windows", 1, true) ~= nil or string.find(l_0_0, "c:\\program files", 1, true) ~= nil or string.find(l_0_0, "c:\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pe.get_exports()
if l_0_1 == nil or l_0_1 < 8 then
  return mp.CLEAN
end
for l_0_3 = 2, l_0_1 do
  if l_0_2[l_0_3 - 1].rva ~= l_0_2[l_0_3].rva then
    return mp.CLEAN
  end
end
mp.readprotection(false)
local l_0_4 = mp.getfilesize()
if l_0_4 == nil or l_0_4 <= 288 then
  return mp.CLEAN
end
local l_0_5 = {
  "\135S!\195\1952O\144\1952O\144\1952O\144\030\205\133\144\1942O\144\030\205\129\144\1932O\144\030\205\134\144\1942O\144\030\205\131\144\1942O\144Rich",
  "?\133\163\222{\228\205\141{\228\205\141{\228\205\141r\156_\141z\228\205\141r\156N\141y\228\205\141r\156Y\141z\228\205\141r\156\\\141z\228\205\141Rich{\228\205\141\000\000"
}
local l_0_6 = mp.readfile(128, 64)
for l_0_7 = 1, #l_0_5 do
  if string.find(l_0_6, l_0_5[l_0_7], 1, true) ~= nil then
    return mp.CLEAN
  end
end
return mp.INFECTED
