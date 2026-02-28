local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_DEVICE_CHARACTERISTICS
L1_1 = L1_1(L2_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.bitand
L3_1 = L1_1
L4_1 = 1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == 1 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "FILE_REMOVABLE_MEDIA"
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.bitand
L3_1 = L1_1
L4_1 = 2
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == 2 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "FILE_READ_ONLY_DEVICE"
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.bitand
L3_1 = L1_1
L4_1 = 16
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == 16 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "FILE_REMOTE_DEVICE"
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.bitand
L3_1 = L1_1
L4_1 = 32
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == 32 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "FILE_DEVICE_IS_MOUNTED"
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.bitand
L3_1 = L1_1
L4_1 = 64
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == 64 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "FILE_VIRTUAL_VOLUME"
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.bitand
L3_1 = L1_1
L4_1 = 2048
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == 2048 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "FILE_CHARACTERISTIC_PNP_DEVICE"
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.bitand
L3_1 = L1_1
L4_1 = 262144
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == 262144 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "FILE_PORTABLE_DEVICE"
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.bitand
L3_1 = L1_1
L4_1 = 264193
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= 0 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILEPATH
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "\\harddiskvolume..?\\efi\\"
L6_1 = 8
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 then
  L3_1 = MpCommon
  L3_1 = L3_1.ExpandEnvironmentVariables
  L4_1 = "%SystemRoot%"
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "%"
    L7_1 = 5
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = sysio
      L4_1 = L4_1.GetFileFsVolumeInformation
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      if L4_1 then
        L5_1 = sysio
        L5_1 = L5_1.GetFileFsVolumeInformation
        L6_1 = L2_1
        L5_1 = L5_1(L6_1)
        if L5_1 then
          L6_1 = L4_1.VolumeSerialNumber
          L7_1 = L5_1.VolumeSerialNumber
          if L6_1 == L7_1 then
            L6_1 = mp
            L6_1 = L6_1.CLEAN
            return L6_1
          end
        end
      end
    end
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
