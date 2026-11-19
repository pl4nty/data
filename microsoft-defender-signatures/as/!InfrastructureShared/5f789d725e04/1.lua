-- Threat: !InfrastructureShared
-- Name: 5f789d725e04
-- Type: 21

if pehdr.NumberOfSections ~= 4 or peattributes.isdll == false or peattributes.hasexports == false or peattributes.epinfirstsect == false or pesecs[1].SizeOfRawData ~= 61440 then
  return mp.CLEAN
end
return mp.INFECTED
