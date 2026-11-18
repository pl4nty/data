-- Threat: !InfrastructureShared
-- Name: 657866b4c412
-- Type: 21

if hstrlog[2].matched then
  mp.set_mpattribute("HSTR:MoloteraeLinkChanger")
end
if 2 <= mp.HSTR_WEIGHT then
  return mp.INFECTED
end
return mp.CLEAN
