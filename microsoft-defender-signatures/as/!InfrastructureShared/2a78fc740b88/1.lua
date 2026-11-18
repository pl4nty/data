-- Threat: !InfrastructureShared
-- Name: 2a78fc740b88
-- Type: 21

if peattributes.x86_image and peattributes.no_imports_dir and peattributes.relocs_stripped and peattributes.no_imports then
  return mp.INFECTED
end
return mp.CLEAN
