-- Threat: !InfrastructureShared
-- Name: 26778d3376a03
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
