-- Threat: !InfrastructureShared
-- Name: !#Lua:FileHasMOTW
-- Type: 12
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = mp.GetMOTWZone()
  if l_0_0 == nil then
    return mp.CLEAN
  end
  mp.set_mpattribute("Lua:MotwZone_" .. l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
