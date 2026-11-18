-- Threat: !InfrastructureShared
-- Name: !#PUA:NonAppPath
-- Type: 10

if mp.get_mpattributesubstring("PUA:Block:") then
  local l_0_0 = string.lower(mp.getfilename())
  if string.sub(l_0_0, 2, 16) ~= ":\\program files" and string.sub(l_0_0, 2, 14) ~= ":\\programdata" then
    return mp.INFECTED
  end
end
return mp.CLEAN
