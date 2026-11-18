-- Threat: !InfrastructureShared
-- Name: !#//Lua:NewDiagCabFile
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & BM_CAB_FILE & MpNewlyCreatedHint

local l_0_0 = mp.getfilename()
if l_0_0 ~= nil and l_0_0:lower():match("%.diagcab$") then
  return mp.INFECTED
end
return mp.CLEAN
