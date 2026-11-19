-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/ReverseLnkExtension.A
-- Type: 12

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:len() < 12 then
  return mp.CLEAN
end
local l_0_1 = string.sub(l_0_0, -4)
local l_0_2 = {
  [".lnk"] = ""
}
if not l_0_2[l_0_1] then
  return mp.CLEAN
end
local l_0_3 = {
  ["\174cip.rcs"] = ""
}
local l_0_4 = string.sub(l_0_0, -12, -5)
if l_0_3[l_0_4] then
  return mp.INFECTED
end
return mp.CLEAN
