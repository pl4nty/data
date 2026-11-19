-- Threat: !InfrastructureShared
-- Name: 254053470526
-- Type: 21

if not mp.get_mpattribute("attrmatch_rescan_notmyapp") then
  local l_0_0 = pe.query_import
  if 0 == l_0_0(pe.IMPORT_STATIC, 4288984855) then
    return mp.CLEAN
  end
  if 0 == l_0_0(pe.IMPORT_STATIC, 3419395426) and 0 == l_0_0(pe.IMPORT_STATIC, 1058758707) then
    return mp.CLEAN
  end
  if 0 == l_0_0(pe.IMPORT_STATIC, 1881577768) then
    return mp.CLEAN
  end
  if 0 == l_0_0(pe.IMPORT_STATIC, 2560256095) then
    return mp.CLEAN
  end
  if 0 == l_0_0(pe.IMPORT_STATIC, 1256947212) then
    return mp.CLEAN
  end
  if 0 == l_0_0(pe.IMPORT_STATIC, 453198482) then
    return mp.CLEAN
  end
  if 0 == l_0_0(pe.IMPORT_STATIC, 133826329) then
    return mp.CLEAN
  end
  mp.set_mpattribute("attrmatch_rescan_notmyapp")
  pe.reemulate()
end
return mp.INFECTED
