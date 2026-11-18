-- Threat: !InfrastructureShared
-- Name: !#TEL:Flafisi.F
-- Type: 13

local l_0_0 = {
  ["iexplore.exe"] = true,
  ["browser_broker.exe"] = true
}
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_1 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  l_0_2 = string.lower(l_0_2)
  if l_0_0[l_0_2] == true then
    local l_0_3 = mp.getfilename()
    if l_0_3 == nil then
      return mp.CLEAN
    end
    l_0_3 = string.lower(l_0_3)
    if string.find(l_0_3, "flash%s*player.*.hta$") ~= nil and mp.get_mpattribute("Lua:HTAExt") and mp.get_mpattribute("RPF:TopLevelFile") then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
