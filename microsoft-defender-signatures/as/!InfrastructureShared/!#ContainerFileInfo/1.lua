-- Threat: !InfrastructureShared
-- Name: !#ContainerFileInfo
-- Type: 12
-- MpAttributes: !RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = l_0_0:sub(-4)
if l_0_1 and l_0_1:sub(1, 1) == "." and l_0_1 == ".bin" and string.find(l_0_0, "->xl/macrosheets/", 1, true) then
  mp.set_mpattribute("Lua:MacrosheetBin")
end
return mp.CLEAN
