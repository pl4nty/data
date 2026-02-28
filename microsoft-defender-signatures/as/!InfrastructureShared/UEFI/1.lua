local L0_1, L1_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = {}
  L1_2 = "\\\\?\\HarddiskVolume%d\\EFI"
  L2_2 = 10
  L3_2 = 1
  L4_2 = L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L8_2 = L1_2
    L7_2 = L1_2.format
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = sysio
    L8_2 = L8_2.IsFolderExists
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L8_2 = #L0_2
      L8_2 = L8_2 + 1
      L0_2[L8_2] = L7_2
    end
  end
  return L0_2
end

Infrastructure_FindEFISystemPartitions = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = 2
  L2_2 = sysio
  L2_2 = L2_2.FindFiles
  L3_2 = A0_2
  L4_2 = "*.efi"
  L5_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = MpCommon
    L8_2 = L8_2.SetGlobalMpAttribute
    L9_2 = "UefiLuaBootloaderScan"
    L8_2(L9_2)
    L8_2 = MpDetection
    L8_2 = L8_2.ScanResource
    L9_2 = "file://"
    L10_2 = L7_2
    L9_2 = L9_2 .. L10_2
    L8_2(L9_2)
    L8_2 = MpCommon
    L8_2 = L8_2.DeleteGlobalMpAttribute
    L9_2 = "UefiLuaBootloaderScan"
    L8_2(L9_2)
  end
  L3_2 = sysio
  L3_2 = L3_2.FindFiles
  L4_2 = A0_2
  L5_2 = "grub.cfg"
  L6_2 = L1_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = ipairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = MpCommon
    L9_2 = L9_2.SetGlobalMpAttribute
    L10_2 = "UefiLuaGrubCfgScan"
    L9_2(L10_2)
    L9_2 = MpDetection
    L9_2 = L9_2.ScanResource
    L10_2 = "file://"
    L11_2 = L8_2
    L10_2 = L10_2 .. L11_2
    L9_2(L10_2)
    L9_2 = MpCommon
    L9_2 = L9_2.DeleteGlobalMpAttribute
    L10_2 = "UefiLuaGrubCfgScan"
    L9_2(L10_2)
  end
end

ScanEFIBootloaders = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = Infrastructure_FindEFISystemPartitions
  L0_2 = L0_2()
  L1_2 = ipairs
  L2_2 = L0_2
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    L6_2 = ScanEFIBootloaders
    L7_2 = L5_2
    L6_2(L7_2)
  end
end

Infrastructure_ScanEFISystemPartitions = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = GetRollingQueue
  L1_2 = "UEFIFirmwareHashList"
  L0_2 = L0_2(L1_2)
  L1_2 = {}
  if L0_2 ~= nil then
    L2_2 = type
    L3_2 = L0_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "table" then
      L2_2 = ipairs
      L3_2 = L0_2
      L2_2, L3_2, L4_2 = L2_2(L3_2)
      for L5_2, L6_2 in L2_2, L3_2, L4_2 do
        if 20 < L5_2 then
          break
        end
        L7_2 = L6_2.key
        L8_2 = L6_2.value
        L1_2[L7_2] = L8_2
      end
    end
  end
  L2_2 = AppendToRollingQueue
  L3_2 = "UEFIFirmwareHashListCachedData"
  L4_2 = "ReportUEFIData"
  L5_2 = safeJsonSerialize
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  L6_2 = 604800
  L7_2 = 10
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end

Infrastructure_ReportUEFIData = L0_1
