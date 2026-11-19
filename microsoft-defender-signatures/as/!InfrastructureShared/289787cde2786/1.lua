-- Threat: !InfrastructureShared
-- Name: 289787cde2786
-- Type: 21

if peattributes.x86_image == true and peattributes.line_numbers_stripped == true and peattributes.locals_symbols_stripped == true and peattributes.no_security == true and peattributes.headerchecksum0 == true and peattributes.hasappendeddata == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
