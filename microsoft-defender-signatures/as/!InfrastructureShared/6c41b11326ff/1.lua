-- Threat: !InfrastructureShared
-- Name: 6c41b11326ff
-- Type: 21

if peattributes.isdll and peattributes.executble_image and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
