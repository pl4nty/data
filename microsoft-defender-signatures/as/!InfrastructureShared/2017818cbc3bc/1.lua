-- Threat: !InfrastructureShared
-- Name: 2017818cbc3bc
-- Type: 21

if peattributes.x86_image == true and peattributes.line_numbers_stripped == true and peattributes.locals_symbols_stripped == true and peattributes.no_security == true and peattributes.headerchecksum0 == true and peattributes.hasappendeddata == true and peattributes.isexe == true and peattributes.no_debug == true and peattributes.no_relocs == true and peattributes.no_comruntime == true and peattributes.no_boundimport == true then
  return mp.INFECTED
end
return mp.CLEAN
