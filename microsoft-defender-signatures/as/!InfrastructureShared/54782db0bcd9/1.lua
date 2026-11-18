-- Threat: !InfrastructureShared
-- Name: 54782db0bcd9
-- Type: 21

if peattributes.isdll and peattributes.hasexports and peattributes.packersigmatched then
  pe.set_peattribute("deep_analysis", true)
  pe.reemulate()
end
return mp.CLEAN
