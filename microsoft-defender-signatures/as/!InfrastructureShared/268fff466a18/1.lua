-- Threat: !InfrastructureShared
-- Name: 268fff466a18
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, ".rtf->word", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
