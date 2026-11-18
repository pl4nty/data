-- Threat: !InfrastructureShared
-- Name: 7f78720d6d57
-- Type: 21

if pehdr.Machine == 34404 then
  mp.set_mpattribute("Lowfi:Win64/Minxer_Coinminer")
else
  mp.set_mpattribute("HSTR:Minxer_Coinminer")
end
return mp.CLEAN
