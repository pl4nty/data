-- Threat: !InfrastructureShared
-- Name: 1861eedb08e9
-- Type: 21

if mp.get_mpattribute("Suspicious:CraftedPE_Import") then
  mp.set_mpattribute("Suspicious:CraftedFile_Import")
end
return mp.CLEAN
