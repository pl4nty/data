-- Threat: !InfrastructureShared
-- Name: 212979bb1669
-- Type: 21

if string.find(mp.getfilename(), "(RarSfx)", 1, true) then
  mp.set_mpattribute("//RarSfxPwdAppdata")
end
return mp.CLEAN
