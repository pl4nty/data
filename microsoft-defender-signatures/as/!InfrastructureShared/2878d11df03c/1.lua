-- Threat: !InfrastructureShared
-- Name: 2878d11df03c
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
