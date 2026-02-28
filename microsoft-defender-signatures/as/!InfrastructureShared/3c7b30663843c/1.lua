local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1
L0_1 = 20
L1_1 = mp
L1_1 = L1_1.SIGATTR_LOG_SZ
L2_1 = {}
L3_1 = {}
L4_1 = {}
L5_1 = {}
L6_1 = 0
L7_1 = {}
L7_1[".jslog"] = true
L7_1[".rba"] = true
L7_1[".kpf"] = true
L7_1[".rsnd"] = true
L7_1[".mcache"] = true
L7_1[".plg"] = true
L7_1[".bix"] = true
L8_1 = 1
L9_1 = L1_1
L10_1 = 1
for L11_1 = L8_1, L9_1, L10_1 do
  L12_1 = sigattr_tail
  L12_1 = L12_1[L11_1]
  L12_1 = L12_1.attribute
  if L12_1 == 16384 then
    L12_1 = sigattr_tail
    L12_1 = L12_1[L11_1]
    L12_1 = L12_1.utf8p1
    L13_1 = L12_1
    L12_1 = L12_1.byte
    L14_1 = 1
    L12_1 = L12_1(L13_1, L14_1)
    if L12_1 ~= 37 then
      L12_1 = sigattr_tail
      L12_1 = L12_1[L11_1]
      L12_1 = L12_1.utf8p1
      if L12_1 then
        L12_1 = sigattr_tail
        L12_1 = L12_1[L11_1]
        L12_1 = L12_1.utf8p1
        L13_1 = L12_1
        L12_1 = L12_1.lower
        L12_1 = L12_1(L13_1)
        L13_1 = L3_1[L12_1]
        if L13_1 == nil then
          L3_1[L12_1] = L11_1
          L6_1 = L6_1 + 1
        end
      end
    end
  end
end
if 10 < L6_1 then
  L8_1 = 1
  L9_1 = L1_1
  L10_1 = 1
  for L11_1 = L8_1, L9_1, L10_1 do
    L12_1 = sigattr_tail
    L12_1 = L12_1[L11_1]
    L12_1 = L12_1.attribute
    if L12_1 == 16389 then
      L12_1 = sigattr_tail
      L12_1 = L12_1[L11_1]
      L12_1 = L12_1.utf8p2
      if L12_1 == "ATTR_d463ed8a" then
        L12_1 = isnull
        L13_1 = sigattr_tail
        L13_1 = L13_1[L11_1]
        L13_1 = L13_1.utf8p1
        L12_1 = L12_1(L13_1)
        if not L12_1 then
          L12_1 = sigattr_tail
          L12_1 = L12_1[L11_1]
          L12_1 = L12_1.utf8p1
          L13_1 = L12_1
          L12_1 = L12_1.lower
          L12_1 = L12_1(L13_1)
          L13_1 = L4_1[L12_1]
          if L13_1 == nil then
            L13_1 = L3_1[L12_1]
            if L13_1 ~= nil then
              L4_1[L12_1] = L11_1
              L14_1 = L12_1
              L13_1 = L12_1.match
              L15_1 = "%.[^%.]+$"
              L13_1 = L13_1(L14_1, L15_1)
              if L13_1 then
                L14_1 = mp
                L14_1 = L14_1.GetExtensionClass
                L15_1 = L13_1
                L14_1 = L14_1(L15_1)
                if L14_1 == 0 then
                  L14_1 = L7_1[L13_1]
                  if not L14_1 then
                    L14_1 = L5_1[L13_1]
                    if L14_1 ~= nil then
                      L14_1 = table
                      L14_1 = L14_1.insert
                      L15_1 = L5_1[L13_1]
                      L16_1 = L11_1
                      L14_1(L15_1, L16_1)
                    else
                      L14_1 = {}
                      L15_1 = L11_1
                      L14_1[1] = L15_1
                      L5_1[L13_1] = L14_1
                    end
                    L14_1 = L5_1[L13_1]
                    L14_1 = #L14_1
                    if 10 <= L14_1 then
                      L14_1 = {}
                      L15_1 = 0
                      L16_1 = pairs
                      L17_1 = L5_1[L13_1]
                      L16_1, L17_1, L18_1 = L16_1(L17_1)
                      for L19_1, L20_1 in L16_1, L17_1, L18_1 do
                        L21_1 = sigattr_tail
                        L21_1 = L21_1[L20_1]
                        L21_1 = L21_1.utf8p1
                        L22_1 = L21_1
                        L21_1 = L21_1.lower
                        L21_1 = L21_1(L22_1)
                        L12_1 = L21_1
                        L21_1 = L3_1[L12_1]
                        L22_1 = {}
                        L23_1 = string
                        L23_1 = L23_1.gmatch
                        L24_1 = sigattr_tail
                        L24_1 = L24_1[L21_1]
                        L24_1 = L24_1.utf8p2
                        L25_1 = "(%w+):(%w+)"
                        L23_1, L24_1, L25_1 = L23_1(L24_1, L25_1)
                        for L26_1, L27_1 in L23_1, L24_1, L25_1 do
                          L22_1[L26_1] = L27_1
                        end
                        L23_1 = -1
                        L24_1 = L22_1.FSize
                        if L24_1 then
                          L24_1 = tonumber
                          L25_1 = L22_1.FSize
                          L24_1 = L24_1(L25_1)
                          if L24_1 then
                            L24_1 = tonumber
                            L25_1 = L22_1.FSize
                            L24_1 = L24_1(L25_1)
                            L23_1 = L24_1
                        end
                        else
                          L24_1 = sysio
                          L24_1 = L24_1.GetFileSize
                          L25_1 = L12_1
                          L24_1 = L24_1(L25_1)
                          L23_1 = L24_1
                        end
                        if L23_1 ~= nil and 256 < L23_1 then
                          L24_1 = ""
                          L25_1 = 0
                          L26_1 = sysio
                          L26_1 = L26_1.ReadFile
                          L27_1 = L12_1
                          L28_1 = 0
                          L29_1 = 256
                          L26_1 = L26_1(L27_1, L28_1, L29_1)
                          if L26_1 then
                            L27_1 = isnull
                            L28_1 = L26_1
                            L27_1 = L27_1(L28_1)
                            if not L27_1 then
                              L27_1 = string
                              L27_1 = L27_1.format
                              L28_1 = "\\x%02X\\x%02X"
                              L29_1 = string
                              L29_1 = L29_1.byte
                              L30_1 = L26_1
                              L31_1 = 1
                              L32_1 = 2
                              L29_1, L30_1, L31_1, L32_1, L33_1, L34_1 = L29_1(L30_1, L31_1, L32_1)
                              L27_1 = L27_1(L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1)
                              L24_1 = L27_1
                              L27_1 = crypto
                              L27_1 = L27_1.ComputeEntropy
                              L28_1 = L26_1
                              L27_1 = L27_1(L28_1)
                              L25_1 = L27_1
                            end
                          end
                          if 7 <= L25_1 then
                            L14_1[L24_1] = 1
                            L27_1 = {}
                            L27_1.path = L12_1
                            L27_1.magic = L24_1
                            L27_1.enc_filesize = L23_1
                            L27_1.entropy = L25_1
                            L28_1 = table
                            L28_1 = L28_1.insert
                            L29_1 = L2_1
                            L30_1 = L27_1
                            L28_1(L29_1, L30_1)
                            L15_1 = L15_1 + 1
                            if 5 < L15_1 then
                              L28_1 = 0
                              L29_1 = pairs
                              L30_1 = L14_1
                              L29_1, L30_1, L31_1 = L29_1(L30_1)
                              for L32_1 in L29_1, L30_1, L31_1 do
                                L28_1 = L28_1 + 1
                              end
                              if 1 < L28_1 then
                                L29_1 = {}
                                L29_1.appended_ext = L13_1
                                L29_1.isMagicMismatch = true
                                L29_1.file_list = L2_1
                                L30_1 = bm
                                L30_1 = L30_1.trigger_sig
                                L31_1 = "GenericRansomware:UnknownFileMeta"
                                L32_1 = safeJsonSerialize
                                L33_1 = L29_1
                                L32_1, L33_1, L34_1 = L32_1(L33_1)
                                L30_1(L31_1, L32_1, L33_1, L34_1)
                                L30_1 = bm
                                L30_1 = L30_1.add_related_string
                                L31_1 = "genda_create_ransom_meta"
                                L32_1 = safeJsonSerialize
                                L33_1 = L29_1
                                L32_1 = L32_1(L33_1)
                                L33_1 = bm
                                L33_1 = L33_1.RelatedStringBMReport
                                L30_1(L31_1, L32_1, L33_1)
                                L30_1 = mp
                                L30_1 = L30_1.INFECTED
                                return L30_1
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  if L0_1 < L6_1 then
    L8_1 = bm
    L8_1 = L8_1.trigger_sig
    L9_1 = "Exclude"
    L10_1 = "NoRansomCreateFile"
    L8_1(L9_1, L10_1)
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
