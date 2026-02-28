local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.packersigmatched
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.hasstandardentry
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 204800 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L1_1 = pe
L1_1 = L1_1.IMAGE_DIRECTORY_ENTRY_SECURITY
L0_1 = L0_1[L1_1]
L0_1 = L0_1.RVA
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L1_1 = pe
L1_1 = L1_1.IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG
L0_1 = L0_1[L1_1]
L0_1 = L0_1.RVA
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L1_1 = pe
L1_1 = L1_1.IMAGE_DIRECTORY_ENTRY_BASERELOC
L0_1 = L0_1[L1_1]
L0_1 = L0_1.RVA
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L1_1 = pe
L1_1 = L1_1.IMAGE_DIRECTORY_ENTRY_RESOURCE
L0_1 = L0_1[L1_1]
L0_1 = L0_1.RVA
if L0_1 ~= 0 then
  L0_1 = pehdr
  L0_1 = L0_1.DataDirectory
  L1_1 = pe
  L1_1 = L1_1.IMAGE_DIRECTORY_ENTRY_RESOURCE
  L0_1 = L0_1[L1_1]
  L0_1 = L0_1.Size
  if 2048 <= L0_1 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = pehdr
L0_1 = L0_1.Machine
if L0_1 == 332 then
  L0_1 = peattributes
  L0_1 = L0_1.isappcontainer
  if not L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.resource_only_dll
    if not L0_1 then
      L0_1 = peattributes
      L0_1 = L0_1.no_ep
      if not L0_1 then
        L0_1 = peattributes
        L0_1 = L0_1.dmg_entrypoint
        if not L0_1 then
          L0_1 = peattributes
          L0_1 = L0_1.dmg_not_executable_image
          if not L0_1 then
            L0_1 = peattributes
            L0_1 = L0_1.dmg_truncated
            if not L0_1 then
              goto lbl_106
            end
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_106::
L0_1 = peattributes
L0_1 = L0_1.dynmem_APIcall
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "MpAPILimitReached"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpAPILimitReached"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.executes_from_dynamic_memory
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpHasExpensiveLoop"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.dynmem_APIcall
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpHasExpensiveLoop"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.executes_from_dynamic_memory
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
