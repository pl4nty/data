local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = peattributes
L0_1 = L0_1.is_process
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.UfsGetMetadataStringA
L1_1 = "LUAUFS:MinerDets"
L2_1 = true
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 and L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "miner"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.enum_mpattributesubstring
L3_1 = "PUA:"
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if 0 < L3_1 then
    L3_1 = ipairs
    L4_1 = L2_1
    L3_1, L4_1, L5_1 = L3_1(L4_1)
    for L6_1, L7_1 in L3_1, L4_1, L5_1 do
      L8_1 = string
      L8_1 = L8_1.lower
      L9_1 = L7_1
      L8_1 = L8_1(L9_1)
      L9_1 = string
      L9_1 = L9_1.find
      L10_1 = L8_1
      L11_1 = "torrent"
      L12_1 = 1
      L13_1 = true
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
      if L9_1 ~= nil then
        L9_1 = mp
        L9_1 = L9_1.CLEAN
        return L9_1
      end
      L9_1 = string
      L9_1 = L9_1.find
      L10_1 = L8_1
      L11_1 = "coinminer"
      L12_1 = 1
      L13_1 = true
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
      if L9_1 == nil then
        L9_1 = string
        L9_1 = L9_1.find
        L10_1 = L8_1
        L11_1 = "namedminer"
        L12_1 = 1
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if L9_1 == nil then
          L9_1 = string
          L9_1 = L9_1.find
          L10_1 = L8_1
          L11_1 = "miner"
          L12_1 = 1
          L13_1 = true
          L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
          if L9_1 ~= nil then
            L9_1 = mp
            L9_1 = L9_1.CLEAN
            return L9_1
          end
        end
      end
    end
  end
end
L3_1 = ""
L4_1 = ""
L5_1 = ""
L6_1 = ""
L7_1 = false
L8_1 = {}
L8_1["0.0.com"] = true
L8_1.kmspico = true
L8_1.microsoft = true
L8_1["microsoft corporation"] = true
L8_1["oracle corporation"] = true
L8_1["www.360.com"] = true
L8_1["www.google.com"] = true
L8_1["www.java.com"] = true
L8_1["www.realtek.com"] = true
L8_1["www.micorosoft.com"] = true
L8_1["www.microsoft.com"] = true
L9_1 = {}
L9_1["dllhostex.exe"] = true
L9_1["explorer.exe"] = true
L9_1["java.exe"] = true
L9_1["microsofthost.exe"] = true
L9_1["rtkauduservice.exe"] = true
L9_1["runtimebroker.exe"] = true
L9_1["safe.exe"] = true
L9_1["services.exe"] = true
L9_1["system.exe"] = true
L9_1["taskmgr.exe"] = true
L9_1["tiworker.exe"] = true
L9_1.voice = true
L9_1["winx.exe"] = true
L10_1 = {}
L10_1["0 0"] = true
L10_1["com surrogate"] = true
L10_1["google crash handler"] = true
L10_1["host process for windows services"] = true
L10_1["java update"] = true
L10_1["java(tm) platform se binary"] = true
L10_1.kmspico = true
L10_1["realtek hd audio service"] = true
L10_1["runtime broker"] = true
L10_1["services and controller app"] = true
L10_1.svchost = true
L10_1.system = true
L10_1["taskmgr tools"] = true
L10_1.voice = true
L10_1["windows explorer"] = true
L10_1["windows modules installer worker"] = true
L10_1["windows x"] = true
L11_1 = {}
L11_1["google update"] = true
L11_1.java = true
L11_1["microsoft corporation. all rights reserved."] = true
L11_1.microsofthost = true
L11_1.rtkauduservice = true
L11_1["services and controller app"] = true
L11_1.svchost = true
L11_1.system = true
L11_1.taskmgr = true
L11_1.voice = true
L11_1["windows x"] = true
L12_1 = {}
L12_1["https://github.com/bendr0id/xmrigcc/"] = true
L12_1["https://github.com/bendr0id/xmrigcc"] = true
L12_1["https://github.com/bendr0id/xmrigcc-amd"] = true
L12_1["www.xmrig.com"] = true
L13_1 = {}
L13_1["xmrig.exe"] = true
L13_1["xmrig-cuda.dll"] = true
L13_1["xmrigminer.exe"] = true
L14_1 = {}
L14_1["xmrig cpu miner"] = true
L14_1["xmrig cuda miner"] = true
L14_1["xmrig cuda plugin"] = true
L14_1["xmrig miner"] = true
L14_1["xmrig opencl miner"] = true
L14_1["xmrigcc-amd opencl miner"] = true
L14_1["xmrigcc command'n'control server"] = true
L14_1["xmrigcc cpu miner"] = true
L15_1 = {}
L15_1.xmrig = true
L15_1.xmrigcc = true
L16_1 = pe
L16_1 = L16_1.get_versioninfo
L16_1 = L16_1()
if L16_1 ~= nil then
  L7_1 = true
  L3_1 = L16_1.CompanyName
  L4_1 = L16_1.OriginalFilename
  L5_1 = L16_1.FileDescription
  L6_1 = L16_1.ProductName
  if L3_1 then
    L17_1 = string
    L17_1 = L17_1.lower
    L18_1 = L3_1
    L17_1 = L17_1(L18_1)
    L3_1 = L17_1
  else
    L3_1 = ""
  end
  if L4_1 then
    L17_1 = string
    L17_1 = L17_1.lower
    L18_1 = L4_1
    L17_1 = L17_1(L18_1)
    L4_1 = L17_1
  else
    L4_1 = ""
  end
  if L5_1 then
    L17_1 = string
    L17_1 = L17_1.lower
    L18_1 = L5_1
    L17_1 = L17_1(L18_1)
    L5_1 = L17_1
  else
    L5_1 = ""
  end
  if L6_1 then
    L17_1 = string
    L17_1 = L17_1.lower
    L18_1 = L6_1
    L17_1 = L17_1(L18_1)
    L6_1 = L17_1
  else
    L6_1 = ""
  end
  L17_1 = L8_1[L3_1]
  if not L17_1 then
    L17_1 = L9_1[L4_1]
    if not L17_1 then
      L17_1 = L10_1[L5_1]
      if not L17_1 then
        L17_1 = L11_1[L6_1]
        if not L17_1 then
          goto lbl_233
        end
      end
    end
  end
  L17_1 = mp
  L17_1 = L17_1.INFECTED
  return L17_1
end
::lbl_233::
L17_1 = string
L17_1 = L17_1.lower
L18_1 = mp
L18_1 = L18_1.getfilename
L18_1, L19_1, L20_1, L21_1, L22_1, L23_1 = L18_1()
L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
L19_1 = L17_1
L18_1 = L17_1.match
L20_1 = "(.+\\)([^\\]+)$"
L18_1, L19_1 = L18_1(L19_1, L20_1)
L20_1 = string
L20_1 = L20_1.sub
L21_1 = L19_1
L22_1 = 1
L23_1 = 5
L20_1 = L20_1(L21_1, L22_1, L23_1)
if L20_1 == "xmrig" then
  L20_1 = mp
  L20_1 = L20_1.CLEAN
  return L20_1
end
if L7_1 then
  L20_1 = L12_1[L3_1]
  if not L20_1 then
    L20_1 = L13_1[L4_1]
    if not L20_1 then
      L20_1 = L14_1[L5_1]
      if not L20_1 then
        L20_1 = L15_1[L6_1]
        if not L20_1 then
          goto lbl_274
        end
      end
    end
  end
  L20_1 = mp
  L20_1 = L20_1.set_mpattribute
  L21_1 = "Miner:HasXMRigFileProperty"
  L20_1(L21_1)
  L20_1 = mp
  L20_1 = L20_1.CLEAN
  return L20_1
end
::lbl_274::
L20_1 = mp
L20_1 = L20_1.INFECTED
return L20_1
