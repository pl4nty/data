local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.GetCertificateInfo
L1_1 = false
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L0_1 = mp
  L0_1 = L0_1.IsTrustedFile
  L1_1 = false
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.IOAVGetDownloadBrowser
    L0_1 = L0_1()
    if L0_1 ~= nil then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = L0_1
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
      if L0_1 == "utorrent.exe" or L0_1 == "bittorrent.exe" then
        L1_1 = mp
        L1_1 = L1_1.set_mpattribute
        L2_1 = "Lua:InvalidSigningPETopLevelIOAVuTorrent"
        L1_1(L2_1)
      else
        L1_1 = mp
        L1_1 = L1_1.set_mpattribute
        L2_1 = "Lua:InvalidSigningPETopLevelIOAV"
        L1_1(L2_1)
        L1_1 = mp
        L1_1 = L1_1.set_mpattribute
        L2_1 = "MpNonCachedLowfi"
        L1_1(L2_1)
      end
    else
      L1_1 = mp
      L1_1 = L1_1.set_mpattribute
      L2_1 = "Lua:InvalidSigningPETopLevelIOAV"
      L1_1(L2_1)
      L1_1 = mp
      L1_1 = L1_1.set_mpattribute
      L2_1 = "MpNonCachedLowfi"
      L1_1(L2_1)
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
