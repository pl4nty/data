-- Threat: !InfrastructureShared
-- Name: 8b78be8da99d
-- Type: 21
-- Flags: 1

if peattributes.isexe and peattributes.is_delphi and pesecs[8].Name == ".rsrc" and pesecs[8].SizeOfRawData >= 3145728 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
