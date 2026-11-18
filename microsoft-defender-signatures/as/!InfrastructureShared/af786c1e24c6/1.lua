-- Threat: !InfrastructureShared
-- Name: af786c1e24c6
-- Type: 21

if peattributes.ismsil == true and peattributes.nx_bit_set == true and peattributes.aslr_bit_set == true and peattributes.no_exception == true then
  return mp.INFECTED
end
return mp.CLEAN
