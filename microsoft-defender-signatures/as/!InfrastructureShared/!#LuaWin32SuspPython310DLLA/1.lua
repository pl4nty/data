local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "BM_UPX_PACKED"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "HSTR:Win32/Python310DLL"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:FnameAttr!python310.dll"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "Lua:CPythonModuleFileName.A"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:Context/FileExportCountGTE!50"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pe
L0_1 = L0_1.get_exports
L0_1, L1_1 = L0_1()
if L0_1 == nil or L0_1 < 1030 or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.IsTrustedFile
L2_1 = L2_1()
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = {}
L3_1.ExportApi = "Py_Main"
L4_1 = {}
L4_1[2213317461] = true
L4_1[1760330568] = true
L4_1[1222413132] = true
L4_1[1223459656] = true
L4_1[2202555200] = true
L4_1[3968026707] = true
L3_1.CleanCodeInit = L4_1
L3_1.ReadCodeSize = 288
L2_1["1000-1300"] = L3_1
L3_1 = "Lua:Win32/SuspPython310DLL.A!"
L4_1 = 500
L5_1 = pairs
L6_1 = L2_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L11_1 = L8_1
  L10_1 = L8_1.match
  L12_1 = "^(%d+)%s*%-%s*(%d+)$"
  L10_1, L11_1 = L10_1(L11_1, L12_1)
  if L10_1 then
    L12_1 = tonumber
    L13_1 = L10_1
    L12_1 = L12_1(L13_1)
    L10_1 = L12_1
  end
  if L11_1 then
    L12_1 = tonumber
    L13_1 = L11_1
    L12_1 = L12_1(L13_1)
    L11_1 = L12_1
  end
  if L0_1 >= L11_1 and L10_1 and L11_1 then
    L12_1 = L11_1 - L10_1
    if 0 < L12_1 then
      L12_1 = L11_1 - L10_1
      if L4_1 < L12_1 then
        L11_1 = L10_1 + L4_1
      end
      L12_1 = L10_1
      L13_1 = L11_1
      L14_1 = 1
      for L15_1 = L12_1, L13_1, L14_1 do
        L16_1 = pe
        L16_1 = L16_1.mmap_string_rva
        L17_1 = L1_1[L15_1]
        L17_1 = L17_1.namerva
        L18_1 = 64
        L16_1 = L16_1(L17_1, L18_1)
        L17_1 = L9_1.ExportApi
        if L16_1 ~= nil and L16_1 == L17_1 then
          L18_1 = L9_1.ReadCodeSize
          L19_1 = L1_1[L15_1]
          L19_1 = L19_1.rva
          if L18_1 ~= nil and L19_1 ~= nil then
            L20_1 = pe
            L20_1 = L20_1.foffset_rva
            L21_1 = L19_1
            L20_1 = L20_1(L21_1)
            L21_1 = L9_1.CleanCodeInit
            if L20_1 ~= nil and L21_1 ~= nil then
              L22_1 = mp
              L22_1 = L22_1.readprotection
              L23_1 = false
              L22_1(L23_1)
              L22_1 = mp
              L22_1 = L22_1.readfile
              L23_1 = L20_1
              L24_1 = L18_1
              L22_1 = L22_1(L23_1, L24_1)
              if L22_1 ~= nil then
                L23_1 = L3_1
                L24_1 = string
                L24_1 = L24_1.lower
                L25_1 = L17_1
                L24_1 = L24_1(L25_1)
                L23_1 = L23_1 .. L24_1
                L24_1 = mp
                L24_1 = L24_1.readu_u32
                L25_1 = L22_1
                L26_1 = 1
                L24_1 = L24_1(L25_1, L26_1)
                L25_1 = L21_1[L24_1]
                if L25_1 == nil then
                  L25_1 = "Lua:Win32/SuspPythonApiCodeInit.A!"
                  L26_1 = string
                  L26_1 = L26_1.lower
                  L27_1 = L17_1
                  L26_1 = L26_1(L27_1)
                  L25_1 = L25_1 .. L26_1
                  L26_1 = mp
                  L26_1 = L26_1.set_mpattribute
                  L27_1 = L25_1
                  L26_1(L27_1)
                  L26_1 = string
                  L26_1 = L26_1.find
                  L27_1 = L22_1
                  L28_1 = "\204\204"
                  L29_1 = 1
                  L30_1 = true
                  L26_1 = L26_1(L27_1, L28_1, L29_1, L30_1)
                  if L26_1 ~= nil then
                    L26_1 = string
                    L26_1 = L26_1.find
                    L27_1 = L22_1
                    L28_1 = "\195"
                    L29_1 = 1
                    L30_1 = true
                    L26_1 = L26_1(L27_1, L28_1, L29_1, L30_1)
                    if L26_1 ~= nil then
                      L26_1 = "Lua:Win32/CheckPythonApiCode.A!"
                      L27_1 = string
                      L27_1 = L27_1.lower
                      L28_1 = L17_1
                      L27_1 = L27_1(L28_1)
                      L26_1 = L26_1 .. L27_1
                      L27_1 = mp
                      L27_1 = L27_1.set_mpattribute
                      L28_1 = L26_1
                      L27_1(L28_1)
                      L27_1 = mp
                      L27_1 = L27_1.CLEAN
                      return L27_1
                  end
                  else
                    L26_1 = mp
                    L26_1 = L26_1.set_mpattribute
                    L27_1 = L23_1
                    L26_1(L27_1)
                    L26_1 = "Lua:Win32/SuspPythonApiCode.A!"
                    L27_1 = string
                    L27_1 = L27_1.lower
                    L28_1 = L17_1
                    L27_1 = L27_1(L28_1)
                    L26_1 = L26_1 .. L27_1
                    L27_1 = mp
                    L27_1 = L27_1.set_mpattribute
                    L28_1 = L26_1
                    L27_1(L28_1)
                    L27_1 = mp
                    L27_1 = L27_1.INFECTED
                    return L27_1
                  end
                end
                L25_1 = mp
                L25_1 = L25_1.CLEAN
                return L25_1
              end
            end
          end
        end
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
