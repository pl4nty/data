-- Threat: !InfrastructureShared
-- Name: ff78da27a0da
-- Type: 21

if hstrlog[7].matched and peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.LOWFI
