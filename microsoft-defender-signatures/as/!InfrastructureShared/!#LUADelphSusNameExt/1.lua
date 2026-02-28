local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 <= 5) then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 1024000 < L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = ",doc.exe"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = ", pdf.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = ", pdf,exe"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = ".pdf.exe"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 == nil then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "\194\183pdf.exe"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if L1_1 == nil then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "_pdf.exe"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if L1_1 == nil then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = ",pdf.exe"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if L1_1 == nil then
              L1_1 = string
              L1_1 = L1_1.find
              L2_1 = L0_1
              L3_1 = "-pdf.exe"
              L4_1 = 1
              L5_1 = true
              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
              if L1_1 == nil then
                L1_1 = string
                L1_1 = L1_1.find
                L2_1 = L0_1
                L3_1 = "_exe.exe"
                L4_1 = 1
                L5_1 = true
                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                if L1_1 == nil then
                  L1_1 = string
                  L1_1 = L1_1.find
                  L2_1 = L0_1
                  L3_1 = ",pdf.exe"
                  L4_1 = 1
                  L5_1 = true
                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                  if L1_1 == nil then
                    L1_1 = string
                    L1_1 = L1_1.find
                    L2_1 = L0_1
                    L3_1 = "  pdf.exe"
                    L4_1 = 1
                    L5_1 = true
                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                    if L1_1 == nil then
                      L1_1 = string
                      L1_1 = L1_1.find
                      L2_1 = L0_1
                      L3_1 = ".jpg.exe"
                      L4_1 = 1
                      L5_1 = true
                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                      if L1_1 == nil then
                        L1_1 = string
                        L1_1 = L1_1.find
                        L2_1 = L0_1
                        L3_1 = "_pdf.iso"
                        L4_1 = 1
                        L5_1 = true
                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                        if L1_1 == nil then
                          L1_1 = string
                          L1_1 = L1_1.find
                          L2_1 = L0_1
                          L3_1 = ",pdf.iso"
                          L4_1 = 1
                          L5_1 = true
                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                          if L1_1 == nil then
                            L1_1 = string
                            L1_1 = L1_1.find
                            L2_1 = L0_1
                            L3_1 = ",pdf.xz"
                            L4_1 = 1
                            L5_1 = true
                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                            if L1_1 == nil then
                              L1_1 = string
                              L1_1 = L1_1.find
                              L2_1 = L0_1
                              L3_1 = ",pdf.z"
                              L4_1 = 1
                              L5_1 = true
                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                              if L1_1 == nil then
                                L1_1 = string
                                L1_1 = L1_1.find
                                L2_1 = L0_1
                                L3_1 = "_pdf.gz"
                                L4_1 = 1
                                L5_1 = true
                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                if L1_1 == nil then
                                  L1_1 = string
                                  L1_1 = L1_1.find
                                  L2_1 = L0_1
                                  L3_1 = ".pdf.exe"
                                  L4_1 = 1
                                  L5_1 = true
                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                  if L1_1 == nil then
                                    L1_1 = string
                                    L1_1 = L1_1.find
                                    L2_1 = L0_1
                                    L3_1 = ", pdf.zip"
                                    L4_1 = 1
                                    L5_1 = true
                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                    if L1_1 == nil then
                                      L1_1 = string
                                      L1_1 = L1_1.find
                                      L2_1 = L0_1
                                      L3_1 = ", pdf.iso"
                                      L4_1 = 1
                                      L5_1 = true
                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                      if L1_1 == nil then
                                        L1_1 = string
                                        L1_1 = L1_1.find
                                        L2_1 = L0_1
                                        L3_1 = ".jpg.ace"
                                        L4_1 = 1
                                        L5_1 = true
                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                        if L1_1 == nil then
                                          L1_1 = string
                                          L1_1 = L1_1.find
                                          L2_1 = L0_1
                                          L3_1 = "_jpeg.scr"
                                          L4_1 = 1
                                          L5_1 = true
                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                          if L1_1 == nil then
                                            L1_1 = string
                                            L1_1 = L1_1.find
                                            L2_1 = L0_1
                                            L3_1 = "_pdf.exe"
                                            L4_1 = 1
                                            L5_1 = true
                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                            if L1_1 == nil then
                                              L1_1 = string
                                              L1_1 = L1_1.find
                                              L2_1 = L0_1
                                              L3_1 = "\194\183pdf.exe"
                                              L4_1 = 1
                                              L5_1 = true
                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                              if L1_1 == nil then
                                                L1_1 = string
                                                L1_1 = L1_1.find
                                                L2_1 = L0_1
                                                L3_1 = "_xls.exe"
                                                L4_1 = 1
                                                L5_1 = true
                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                if L1_1 == nil then
                                                  L1_1 = string
                                                  L1_1 = L1_1.find
                                                  L2_1 = L0_1
                                                  L3_1 = ".pptx.exe"
                                                  L4_1 = 1
                                                  L5_1 = true
                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                  if L1_1 == nil then
                                                    L1_1 = string
                                                    L1_1 = L1_1.find
                                                    L2_1 = L0_1
                                                    L3_1 = ".pdf.gz"
                                                    L4_1 = 1
                                                    L5_1 = true
                                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                    if L1_1 == nil then
                                                      L1_1 = string
                                                      L1_1 = L1_1.find
                                                      L2_1 = L0_1
                                                      L3_1 = ".pdf.ace"
                                                      L4_1 = 1
                                                      L5_1 = true
                                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                      if L1_1 == nil then
                                                        L1_1 = string
                                                        L1_1 = L1_1.find
                                                        L2_1 = L0_1
                                                        L3_1 = "- pdf.exe"
                                                        L4_1 = 1
                                                        L5_1 = true
                                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                        if L1_1 == nil then
                                                          L1_1 = string
                                                          L1_1 = L1_1.find
                                                          L2_1 = L0_1
                                                          L3_1 = "pdf.scr"
                                                          L4_1 = 1
                                                          L5_1 = true
                                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                          if L1_1 == nil then
                                                            L1_1 = string
                                                            L1_1 = L1_1.find
                                                            L2_1 = L0_1
                                                            L3_1 = "docs. jpg.exe"
                                                            L4_1 = 1
                                                            L5_1 = true
                                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                            if L1_1 == nil then
                                                              L1_1 = string
                                                              L1_1 = L1_1.find
                                                              L2_1 = L0_1
                                                              L3_1 = ".pdf...exe"
                                                              L4_1 = 1
                                                              L5_1 = true
                                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                              if L1_1 == nil then
                                                                L1_1 = string
                                                                L1_1 = L1_1.find
                                                                L2_1 = L0_1
                                                                L3_1 = "jpg..exe"
                                                                L4_1 = 1
                                                                L5_1 = true
                                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                if L1_1 == nil then
                                                                  L1_1 = string
                                                                  L1_1 = L1_1.find
                                                                  L2_1 = L0_1
                                                                  L3_1 = "-doc.exe"
                                                                  L4_1 = 1
                                                                  L5_1 = true
                                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                  if L1_1 == nil then
                                                                    L1_1 = string
                                                                    L1_1 = L1_1.find
                                                                    L2_1 = L0_1
                                                                    L3_1 = "-doc.iso"
                                                                    L4_1 = 1
                                                                    L5_1 = true
                                                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                    if L1_1 == nil then
                                                                      L1_1 = string
                                                                      L1_1 = L1_1.find
                                                                      L2_1 = L0_1
                                                                      L3_1 = ".xlsx.exe"
                                                                      L4_1 = 1
                                                                      L5_1 = true
                                                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                      if L1_1 == nil then
                                                                        L1_1 = string
                                                                        L1_1 = L1_1.find
                                                                        L2_1 = L0_1
                                                                        L3_1 = ".pdf....bat"
                                                                        L4_1 = 1
                                                                        L5_1 = true
                                                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                        if L1_1 == nil then
                                                                          L1_1 = string
                                                                          L1_1 = L1_1.find
                                                                          L2_1 = L0_1
                                                                          L3_1 = "_pdff.exe"
                                                                          L4_1 = 1
                                                                          L5_1 = true
                                                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                          if L1_1 == nil then
                                                                            L1_1 = string
                                                                            L1_1 = L1_1.find
                                                                            L2_1 = L0_1
                                                                            L3_1 = ".doc.exe"
                                                                            L4_1 = 1
                                                                            L5_1 = true
                                                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                            if L1_1 == nil then
                                                                              L1_1 = string
                                                                              L1_1 = L1_1.find
                                                                              L2_1 = L0_1
                                                                              L3_1 = " jbg.exe"
                                                                              L4_1 = 1
                                                                              L5_1 = true
                                                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                              if L1_1 == nil then
                                                                                L1_1 = string
                                                                                L1_1 = L1_1.find
                                                                                L2_1 = L0_1
                                                                                L3_1 = "_xlx.exe"
                                                                                L4_1 = 1
                                                                                L5_1 = true
                                                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                if L1_1 == nil then
                                                                                  L1_1 = string
                                                                                  L1_1 = L1_1.find
                                                                                  L2_1 = L0_1
                                                                                  L3_1 = "viable solution.pcr"
                                                                                  L4_1 = 1
                                                                                  L5_1 = true
                                                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                  if L1_1 == nil then
                                                                                    L1_1 = string
                                                                                    L1_1 = L1_1.find
                                                                                    L2_1 = L0_1
                                                                                    L3_1 = "_xlsx.lzh.exe"
                                                                                    L4_1 = 1
                                                                                    L5_1 = true
                                                                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                    if L1_1 == nil then
                                                                                      L1_1 = string
                                                                                      L1_1 = L1_1.find
                                                                                      L2_1 = L0_1
                                                                                      L3_1 = "^^dwg.scr"
                                                                                      L4_1 = 1
                                                                                      L5_1 = true
                                                                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                      if L1_1 == nil then
                                                                                        L1_1 = string
                                                                                        L1_1 = L1_1.find
                                                                                        L2_1 = L0_1
                                                                                        L3_1 = ",pdf.img"
                                                                                        L4_1 = 1
                                                                                        L5_1 = true
                                                                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                        if L1_1 == nil then
                                                                                          L1_1 = string
                                                                                          L1_1 = L1_1.find
                                                                                          L2_1 = L0_1
                                                                                          L3_1 = ".img.exe"
                                                                                          L4_1 = 1
                                                                                          L5_1 = true
                                                                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                          if L1_1 == nil then
                                                                                            L1_1 = string
                                                                                            L1_1 = L1_1.find
                                                                                            L2_1 = L0_1
                                                                                            L3_1 = "factura..exe"
                                                                                            L4_1 = 1
                                                                                            L5_1 = true
                                                                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                            if L1_1 == nil then
                                                                                              L1_1 = string
                                                                                              L1_1 = L1_1.find
                                                                                              L2_1 = L0_1
                                                                                              L3_1 = "payment $5,860.exe"
                                                                                              L4_1 = 1
                                                                                              L5_1 = true
                                                                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                              if L1_1 == nil then
                                                                                                L1_1 = string
                                                                                                L1_1 = L1_1.find
                                                                                                L2_1 = L0_1
                                                                                                L3_1 = "quotation.ace"
                                                                                                L4_1 = 1
                                                                                                L5_1 = true
                                                                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                if L1_1 == nil then
                                                                                                  L1_1 = string
                                                                                                  L1_1 = L1_1.find
                                                                                                  L2_1 = L0_1
                                                                                                  L3_1 = "%.pdf_.+%.exe"
                                                                                                  L1_1 = L1_1(L2_1, L3_1)
                                                                                                  if L1_1 == nil then
                                                                                                    L1_1 = string
                                                                                                    L1_1 = L1_1.find
                                                                                                    L2_1 = L0_1
                                                                                                    L3_1 = "%.pdf_.+%.r13"
                                                                                                    L1_1 = L1_1(L2_1, L3_1)
                                                                                                    if L1_1 == nil then
                                                                                                      L1_1 = string
                                                                                                      L1_1 = L1_1.find
                                                                                                      L2_1 = L0_1
                                                                                                      L3_1 = "%.png__+%.exe"
                                                                                                      L1_1 = L1_1(L2_1, L3_1)
                                                                                                      if L1_1 == nil then
                                                                                                        L1_1 = string
                                                                                                        L1_1 = L1_1.find
                                                                                                        L2_1 = L0_1
                                                                                                        L3_1 = "mmmobi%d%d%d%d+%.exe"
                                                                                                        L1_1 = L1_1(L2_1, L3_1)
                                                                                                        if L1_1 == nil then
                                                                                                          L1_1 = string
                                                                                                          L1_1 = L1_1.find
                                                                                                          L2_1 = L0_1
                                                                                                          L3_1 = "justificante %d%d %d%d 2022pdf.exe"
                                                                                                          L1_1 = L1_1(L2_1, L3_1)
                                                                                                          if L1_1 == nil then
                                                                                                            L1_1 = string
                                                                                                            L1_1 = L1_1.find
                                                                                                            L2_1 = L0_1
                                                                                                            L3_1 = "justificante%d%d%d%d2022pdf%.exe"
                                                                                                            L1_1 = L1_1(L2_1, L3_1)
                                                                                                            if L1_1 == nil then
                                                                                                              L1_1 = string
                                                                                                              L1_1 = L1_1.find
                                                                                                              L2_1 = L0_1
                                                                                                              L3_1 = "scan_img_invoice #%d%d%d%d+2022%-03%-14%.exe"
                                                                                                              L1_1 = L1_1(L2_1, L3_1)
                                                                                                              if L1_1 == nil then
                                                                                                                L1_1 = string
                                                                                                                L1_1 = L1_1.find
                                                                                                                L2_1 = L0_1
                                                                                                                L3_1 = "scan_2022_%d%d_%d%d_%d%d+_%d%d+_%d%d+_%d%d+%.exe"
                                                                                                                L1_1 = L1_1(L2_1, L3_1)
                                                                                                                if L1_1 == nil then
                                                                                                                  L1_1 = string
                                                                                                                  L1_1 = L1_1.find
                                                                                                                  L2_1 = L0_1
                                                                                                                  L3_1 = "hxd%.png$"
                                                                                                                  L1_1 = L1_1(L2_1, L3_1)
                                                                                                                  if L1_1 == nil then
                                                                                                                    L1_1 = string
                                                                                                                    L1_1 = L1_1.find
                                                                                                                    L2_1 = L0_1
                                                                                                                    L3_1 = "newsoftware%-tester%.exe$"
                                                                                                                    L1_1 = L1_1(L2_1, L3_1)
                                                                                                                    if L1_1 == nil then
                                                                                                                      goto lbl_539
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
              end
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_539::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
