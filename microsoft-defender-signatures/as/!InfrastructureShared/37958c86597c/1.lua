-- Threat: !InfrastructureShared
-- Name: 37958c86597c
-- Type: 21

if pehdr.NumberOfSections == 8 then
  pe.set_image_filename("\"myapp.exe\" /install")
  pe.reemulate()
end
return mp.INFECTED
