-- Threat: !InfrastructureShared
-- Name: 4695e1d2a70c
-- Type: 21

if mp.get_mpattribute("SIGATTR:DelphiFile") and pehdr.NumberOfSections == 8 then
  pe.set_image_filename("\"myapp.exe\" /install")
  pe.reemulate()
end
mp.set_mpattribute("PUA:Block:Prifou")
return mp.INFECTED
