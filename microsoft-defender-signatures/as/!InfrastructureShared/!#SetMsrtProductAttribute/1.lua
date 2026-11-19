-- Threat: !InfrastructureShared
-- Name: !#SetMsrtProductAttribute
-- Type: 12

if versioning.GetProduct() == 13 then
  mp.set_mpattribute("/IsMSRTProduct")
end
return mp.CLEAN
