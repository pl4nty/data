-- Threat: !InfrastructureShared
-- Name: 6f2967aafe95
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
