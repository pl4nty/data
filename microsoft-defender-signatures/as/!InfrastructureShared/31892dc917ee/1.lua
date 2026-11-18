-- Threat: !InfrastructureShared
-- Name: 31892dc917ee
-- Type: 21

if pehdr.NumberOfSections == 8 then
  pe.set_image_filename("\"myapp.exe\" /install")
  pe.reemulate()
end
return mp.INFECTED
