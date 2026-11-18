-- Threat: !InfrastructureShared
-- Name: !#Lua:PossibleWormFileName
-- Type: 10

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  if string.sub(l_0_0, 1, 1) == "P" then
    l_0_0 = string.lower(l_0_0)
    if string.match(l_0_0, "photo_%d%d%d%.jpe?g%-www%.facebook%.com%.exe") ~= nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
