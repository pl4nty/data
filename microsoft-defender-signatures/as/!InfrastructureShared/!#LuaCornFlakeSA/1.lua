-- Threat: !InfrastructureShared
-- Name: !#Lua:CornFlake.SA
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (BM_TEXT_FILE | BM_SCRIPT_OR_TEXT_FILE)

local l_0_0 = mp.enum_mpattributesubstring("SCRT:5351.CornFlake")
if 3 <= #l_0_0 then
  mp.set_mpattribute("Lua:CornFlake.BS1")
  return mp.INFECTED
elseif #l_0_0 == 2 then
  mp.set_mpattribute("Lua:CornFlake.MS1")
  return mp.CLEAN
end
return mp.CLEAN
