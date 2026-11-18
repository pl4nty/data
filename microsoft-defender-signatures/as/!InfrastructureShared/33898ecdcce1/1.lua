-- Threat: !InfrastructureShared
-- Name: 33898ecdcce1
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") and pehdr.NumberOfSections == 8 then
  pe.set_image_filename("\"myapp.exe\" /install")
  pe.reemulate()
end
return mp.INFECTED
