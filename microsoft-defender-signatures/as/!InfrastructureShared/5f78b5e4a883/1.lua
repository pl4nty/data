-- Threat: !InfrastructureShared
-- Name: 5f78b5e4a883
-- Type: 21

if peattributes.isdll and peattributes.hasexports and hstrlog[1].VA - hstrlog[2].VA < 9472 then
  return mp.INFECTED
end
return mp.CLEAN
