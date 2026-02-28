local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = L0_1 - 70
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = tostring
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = L1_1
L5_1 = 20
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "/prev%s+(%d+)"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L4_1 = tonumber
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
end
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = L3_1
L6_1 = 2048
L4_1 = L4_1(L5_1, L6_1)
L6_1 = L4_1
L5_1 = L4_1.match
L7_1 = "(%d)%s+(%d+)"
L5_1, L6_1 = L5_1(L6_1, L7_1)
L7_1 = tonumber
L8_1 = L6_1 or L8_1
if not L6_1 then
  L8_1 = 0
end
L7_1 = L7_1(L8_1)
L6_1 = L7_1
if not L6_1 and L6_1 == 0 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
if 100 < L6_1 then
  L6_1 = 100
end
L7_1 = 1
L9_1 = L4_1
L8_1 = L4_1.gmatch
L10_1 = "(%d%d%d%d%d%d%d%d%d%d)%s+(%d+)%s+([nf])"
L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1)
for L11_1, L12_1, L13_1 in L8_1, L9_1, L10_1 do
  if L13_1 == "n" then
    L15_1 = L11_1
    L14_1 = L11_1.gsub
    L16_1 = "^0+"
    L17_1 = ""
    L14_1 = L14_1(L15_1, L16_1, L17_1)
    L11_1 = L14_1
    L14_1 = mp
    L14_1 = L14_1.readfile
    L15_1 = L11_1
    L16_1 = 30
    L14_1 = L14_1(L15_1, L16_1)
    L15_1 = string
    L15_1 = L15_1.lower
    L16_1 = L14_1
    L15_1 = L15_1(L16_1)
    L14_1 = L15_1
    L15_1 = string
    L15_1 = L15_1.find
    L16_1 = L14_1
    L17_1 = "/type/annot"
    L18_1 = 1
    L19_1 = true
    L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
    if L15_1 ~= nil then
      L15_1 = mp
      L15_1 = L15_1.readfile
      L16_1 = L11_1
      L17_1 = 1200
      L15_1 = L15_1(L16_1, L17_1)
      L16_1 = string
      L16_1 = L16_1.lower
      L17_1 = L15_1
      L16_1 = L16_1(L17_1)
      L15_1 = L16_1
      L16_1 = string
      L16_1 = L16_1.find
      L17_1 = L15_1
      L18_1 = [[
/a<</s/uri
/uri(http]]
      L19_1 = 1
      L20_1 = true
      L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
      if L16_1 ~= nil then
        L16_1 = string
        L16_1 = L16_1.find
        L17_1 = L15_1
        L18_1 = [[
/type/action>>
/subtype/link>>]]
        L19_1 = 1
        L20_1 = true
        L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
        if L16_1 ~= nil then
          L16_1 = string
          L16_1 = L16_1.find
          L17_1 = L15_1
          L18_1 = "http%a%://%w+%.zuwufag%.com/"
          L19_1 = 1
          L20_1 = false
          L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
          if L16_1 == nil then
            L16_1 = string
            L16_1 = L16_1.find
            L17_1 = L15_1
            L18_1 = "http%a%://%w+%.godoxevez%.com/"
            L19_1 = 1
            L20_1 = false
            L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
            if L16_1 == nil then
              L16_1 = string
              L16_1 = L16_1.find
              L17_1 = L15_1
              L18_1 = "http%a%://%w+%.tugoduzak%.com/"
              L19_1 = 1
              L20_1 = false
              L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
              if L16_1 == nil then
                L16_1 = string
                L16_1 = L16_1.find
                L17_1 = L15_1
                L18_1 = "http%a%://%w+%.nurepikis%.com/"
                L19_1 = 1
                L20_1 = false
                L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                if L16_1 == nil then
                  L16_1 = string
                  L16_1 = L16_1.find
                  L17_1 = L15_1
                  L18_1 = "http%a%://%w+%.gonujovux%.com/"
                  L19_1 = 1
                  L20_1 = false
                  L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                  if L16_1 == nil then
                    L16_1 = string
                    L16_1 = L16_1.find
                    L17_1 = L15_1
                    L18_1 = "http%a%://%w+%.maxudijuz%.com/"
                    L19_1 = 1
                    L20_1 = false
                    L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                    if L16_1 == nil then
                      L16_1 = string
                      L16_1 = L16_1.find
                      L17_1 = L15_1
                      L18_1 = "http%a%://%w+%.pofezaf%.com/"
                      L19_1 = 1
                      L20_1 = false
                      L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                      if L16_1 == nil then
                        L16_1 = string
                        L16_1 = L16_1.find
                        L17_1 = L15_1
                        L18_1 = "http%a%://%w+%.dutabuz%.com/"
                        L19_1 = 1
                        L20_1 = false
                        L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                        if L16_1 == nil then
                          L16_1 = string
                          L16_1 = L16_1.find
                          L17_1 = L15_1
                          L18_1 = "http%a%://%w+%.bebopim%.com/"
                          L19_1 = 1
                          L20_1 = false
                          L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                          if L16_1 == nil then
                            L16_1 = string
                            L16_1 = L16_1.find
                            L17_1 = L15_1
                            L18_1 = "http%a%://%w+%.vimemug%.com/"
                            L19_1 = 1
                            L20_1 = false
                            L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                            if L16_1 == nil then
                              L16_1 = string
                              L16_1 = L16_1.find
                              L17_1 = L15_1
                              L18_1 = "http%a%://%w+%.lovali%.co%.za/"
                              L19_1 = 1
                              L20_1 = false
                              L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                              if L16_1 == nil then
                                L16_1 = string
                                L16_1 = L16_1.find
                                L17_1 = L15_1
                                L18_1 = "http%a%://%w+%.riwitamo%.com/"
                                L19_1 = 1
                                L20_1 = false
                                L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                                if L16_1 == nil then
                                  L16_1 = string
                                  L16_1 = L16_1.find
                                  L17_1 = L15_1
                                  L18_1 = "http%a%://%w+%.muvemisavo%.com/"
                                  L19_1 = 1
                                  L20_1 = false
                                  L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                                  if L16_1 == nil then
                                    L16_1 = string
                                    L16_1 = L16_1.find
                                    L17_1 = L15_1
                                    L18_1 = "http%a%://%w+%.yftejum%.com/"
                                    L19_1 = 1
                                    L20_1 = false
                                    L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                                    if L16_1 == nil then
                                      L16_1 = string
                                      L16_1 = L16_1.find
                                      L17_1 = L15_1
                                      L18_1 = "http%a%://%w+%.pifazoveju%.com/"
                                      L19_1 = 1
                                      L20_1 = false
                                      L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                                      if L16_1 == nil then
                                        L16_1 = string
                                        L16_1 = L16_1.find
                                        L17_1 = L15_1
                                        L18_1 = "http%a%://%w+%.bovetewa%.com/"
                                        L19_1 = 1
                                        L20_1 = false
                                        L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                                        if L16_1 == nil then
                                          L16_1 = string
                                          L16_1 = L16_1.find
                                          L17_1 = L15_1
                                          L18_1 = "http%a%://%w+%.jufewine%.com/"
                                          L19_1 = 1
                                          L20_1 = false
                                          L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                                          if L16_1 == nil then
                                            goto lbl_273
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
            end
          end
          L16_1 = mp
          L16_1 = L16_1.set_mpattribute
          L17_1 = "LUA:PDF/FakeCaptcha.AA"
          L16_1(L17_1)
          L16_1 = mp
          L16_1 = L16_1.INFECTED
          do return L16_1 end
          ::lbl_273::
          L16_1 = mp
          L16_1 = L16_1.INFECTED
          return L16_1
        end
      end
    end
  end
  L7_1 = L7_1 + 1
  if L6_1 < L7_1 then
    break
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
