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
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "_pdf__.exe"
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
    L3_1 = ".pdf..rar"
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
        L3_1 = "_pdf.xz"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if L1_1 == nil then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = ".gz.exe"
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
              L3_1 = ".tar.xz"
              L4_1 = 1
              L5_1 = true
              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
              if L1_1 == nil then
                L1_1 = string
                L1_1 = L1_1.find
                L2_1 = L0_1
                L3_1 = "_pdf_gz.bin"
                L4_1 = 1
                L5_1 = true
                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                if L1_1 == nil then
                  L1_1 = string
                  L1_1 = L1_1.find
                  L2_1 = L0_1
                  L3_1 = "_xlxs.exe"
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
                      L3_1 = ",docx.exe"
                      L4_1 = 1
                      L5_1 = true
                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                      if L1_1 == nil then
                        L1_1 = string
                        L1_1 = L1_1.find
                        L2_1 = L0_1
                        L3_1 = ".txt.exe"
                        L4_1 = 1
                        L5_1 = true
                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                        if L1_1 == nil then
                          L1_1 = string
                          L1_1 = L1_1.find
                          L2_1 = L0_1
                          L3_1 = "xlsx.exe"
                          L4_1 = 1
                          L5_1 = true
                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                          if L1_1 == nil then
                            L1_1 = string
                            L1_1 = L1_1.find
                            L2_1 = L0_1
                            L3_1 = ".xlsx.z"
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
                                L3_1 = "-pdf.ace"
                                L4_1 = 1
                                L5_1 = true
                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                if L1_1 == nil then
                                  L1_1 = string
                                  L1_1 = L1_1.find
                                  L2_1 = L0_1
                                  L3_1 = "_pdf.ace"
                                  L4_1 = 1
                                  L5_1 = true
                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                  if L1_1 == nil then
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
                                      L3_1 = ".png.zip.exe"
                                      L4_1 = 1
                                      L5_1 = true
                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                      if L1_1 == nil then
                                        L1_1 = string
                                        L1_1 = L1_1.find
                                        L2_1 = L0_1
                                        L3_1 = "_pdf.zip"
                                        L4_1 = 1
                                        L5_1 = true
                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                        if L1_1 == nil then
                                          L1_1 = string
                                          L1_1 = L1_1.find
                                          L2_1 = L0_1
                                          L3_1 = ".pdf.cab"
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
                                              L3_1 = ".pdf.rar.exe"
                                              L4_1 = 1
                                              L5_1 = true
                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                              if L1_1 == nil then
                                                L1_1 = string
                                                L1_1 = L1_1.find
                                                L2_1 = L0_1
                                                L3_1 = "_jpg.exe"
                                                L4_1 = 1
                                                L5_1 = true
                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                if L1_1 == nil then
                                                  L1_1 = string
                                                  L1_1 = L1_1.find
                                                  L2_1 = L0_1
                                                  L3_1 = ",pdf.pif"
                                                  L4_1 = 1
                                                  L5_1 = true
                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                  if L1_1 == nil then
                                                    L1_1 = string
                                                    L1_1 = L1_1.find
                                                    L2_1 = L0_1
                                                    L3_1 = "..com"
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
                                                        L3_1 = ".docx.exe"
                                                        L4_1 = 1
                                                        L5_1 = true
                                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                        if L1_1 == nil then
                                                          L1_1 = string
                                                          L1_1 = L1_1.find
                                                          L2_1 = L0_1
                                                          L3_1 = "..exe"
                                                          L4_1 = 1
                                                          L5_1 = true
                                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                          if L1_1 == nil then
                                                            L1_1 = string
                                                            L1_1 = L1_1.find
                                                            L2_1 = L0_1
                                                            L3_1 = "xxx.exe"
                                                            L4_1 = 1
                                                            L5_1 = true
                                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                            if L1_1 == nil then
                                                              L1_1 = string
                                                              L1_1 = L1_1.find
                                                              L2_1 = L0_1
                                                              L3_1 = " .bat"
                                                              L4_1 = 1
                                                              L5_1 = true
                                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                              if L1_1 == nil then
                                                                L1_1 = string
                                                                L1_1 = L1_1.find
                                                                L2_1 = L0_1
                                                                L3_1 = ".xls.exe"
                                                                L4_1 = 1
                                                                L5_1 = true
                                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                if L1_1 == nil then
                                                                  L1_1 = string
                                                                  L1_1 = L1_1.find
                                                                  L2_1 = L0_1
                                                                  L3_1 = ",xlsx.exe"
                                                                  L4_1 = 1
                                                                  L5_1 = true
                                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                  if L1_1 == nil then
                                                                    L1_1 = string
                                                                    L1_1 = L1_1.find
                                                                    L2_1 = L0_1
                                                                    L3_1 = "_pdf.rar"
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
                                                                        L3_1 = "-pdf.gz.rar"
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
                                                                            L3_1 = ".pdf.gz.exe"
                                                                            L4_1 = 1
                                                                            L5_1 = true
                                                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                            if L1_1 == nil then
                                                                              L1_1 = string
                                                                              L1_1 = L1_1.find
                                                                              L2_1 = L0_1
                                                                              L3_1 = "pdf.gz.iso"
                                                                              L4_1 = 1
                                                                              L5_1 = true
                                                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                              if L1_1 == nil then
                                                                                L1_1 = string
                                                                                L1_1 = L1_1.find
                                                                                L2_1 = L0_1
                                                                                L3_1 = "_pdf_.exe"
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
                                                                                    L3_1 = ".xlxs.exe"
                                                                                    L4_1 = 1
                                                                                    L5_1 = true
                                                                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                    if L1_1 == nil then
                                                                                      L1_1 = string
                                                                                      L1_1 = L1_1.find
                                                                                      L2_1 = L0_1
                                                                                      L3_1 = ".pdf.uue"
                                                                                      L4_1 = 1
                                                                                      L5_1 = true
                                                                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                      if L1_1 == nil then
                                                                                        L1_1 = string
                                                                                        L1_1 = L1_1.find
                                                                                        L2_1 = L0_1
                                                                                        L3_1 = "scr.pdf.r00"
                                                                                        L4_1 = 1
                                                                                        L5_1 = true
                                                                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                        if L1_1 == nil then
                                                                                          L1_1 = string
                                                                                          L1_1 = L1_1.find
                                                                                          L2_1 = L0_1
                                                                                          L3_1 = ".pdf.tar"
                                                                                          L4_1 = 1
                                                                                          L5_1 = true
                                                                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                          if L1_1 == nil then
                                                                                            L1_1 = string
                                                                                            L1_1 = L1_1.find
                                                                                            L2_1 = L0_1
                                                                                            L3_1 = "_pdf.arj"
                                                                                            L4_1 = 1
                                                                                            L5_1 = true
                                                                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                            if L1_1 == nil then
                                                                                              L1_1 = string
                                                                                              L1_1 = L1_1.find
                                                                                              L2_1 = L0_1
                                                                                              L3_1 = ".img.iso"
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
                                                                                                  L3_1 = "scan copy.exe"
                                                                                                  L4_1 = 1
                                                                                                  L5_1 = true
                                                                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                  if L1_1 == nil then
                                                                                                    L1_1 = string
                                                                                                    L1_1 = L1_1.find
                                                                                                    L2_1 = L0_1
                                                                                                    L3_1 = ",xls.exe"
                                                                                                    L4_1 = 1
                                                                                                    L5_1 = true
                                                                                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                    if L1_1 == nil then
                                                                                                      L1_1 = string
                                                                                                      L1_1 = L1_1.find
                                                                                                      L2_1 = L0_1
                                                                                                      L3_1 = ".xslx.exe"
                                                                                                      L4_1 = 1
                                                                                                      L5_1 = true
                                                                                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                      if L1_1 == nil then
                                                                                                        L1_1 = string
                                                                                                        L1_1 = L1_1.find
                                                                                                        L2_1 = L0_1
                                                                                                        L3_1 = "jewellerymanagementsystem.exe"
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
                                                                                                            L3_1 = ".xlsx.bat"
                                                                                                            L4_1 = 1
                                                                                                            L5_1 = true
                                                                                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                            if L1_1 == nil then
                                                                                                              L1_1 = string
                                                                                                              L1_1 = L1_1.find
                                                                                                              L2_1 = L0_1
                                                                                                              L3_1 = ".png.exe"
                                                                                                              L4_1 = 1
                                                                                                              L5_1 = true
                                                                                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                              if L1_1 == nil then
                                                                                                                L1_1 = string
                                                                                                                L1_1 = L1_1.find
                                                                                                                L2_1 = L0_1
                                                                                                                L3_1 = "rfq.exe"
                                                                                                                L4_1 = 1
                                                                                                                L5_1 = true
                                                                                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                if L1_1 == nil then
                                                                                                                  L1_1 = string
                                                                                                                  L1_1 = L1_1.find
                                                                                                                  L2_1 = L0_1
                                                                                                                  L3_1 = "_pdf.com"
                                                                                                                  L4_1 = 1
                                                                                                                  L5_1 = true
                                                                                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                  if L1_1 == nil then
                                                                                                                    L1_1 = string
                                                                                                                    L1_1 = L1_1.find
                                                                                                                    L2_1 = L0_1
                                                                                                                    L3_1 = ".pdf.bat"
                                                                                                                    L4_1 = 1
                                                                                                                    L5_1 = true
                                                                                                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                    if L1_1 == nil then
                                                                                                                      L1_1 = string
                                                                                                                      L1_1 = L1_1.find
                                                                                                                      L2_1 = L0_1
                                                                                                                      L3_1 = ".pdf_.exe"
                                                                                                                      L4_1 = 1
                                                                                                                      L5_1 = true
                                                                                                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                      if L1_1 == nil then
                                                                                                                        L1_1 = string
                                                                                                                        L1_1 = L1_1.find
                                                                                                                        L2_1 = L0_1
                                                                                                                        L3_1 = "_pdf (2).exe"
                                                                                                                        L4_1 = 1
                                                                                                                        L5_1 = true
                                                                                                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                        if L1_1 == nil then
                                                                                                                          L1_1 = string
                                                                                                                          L1_1 = L1_1.find
                                                                                                                          L2_1 = L0_1
                                                                                                                          L3_1 = "_xlsx_.exe"
                                                                                                                          L4_1 = 1
                                                                                                                          L5_1 = true
                                                                                                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                          if L1_1 == nil then
                                                                                                                            L1_1 = string
                                                                                                                            L1_1 = L1_1.find
                                                                                                                            L2_1 = L0_1
                                                                                                                            L3_1 = "-pdf-.exe"
                                                                                                                            L4_1 = 1
                                                                                                                            L5_1 = true
                                                                                                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                            if L1_1 == nil then
                                                                                                                              L1_1 = string
                                                                                                                              L1_1 = L1_1.find
                                                                                                                              L2_1 = L0_1
                                                                                                                              L3_1 = ".com.exe"
                                                                                                                              L4_1 = 1
                                                                                                                              L5_1 = true
                                                                                                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                              if L1_1 == nil then
                                                                                                                                L1_1 = string
                                                                                                                                L1_1 = L1_1.find
                                                                                                                                L2_1 = L0_1
                                                                                                                                L3_1 = "pdff.exe"
                                                                                                                                L4_1 = 1
                                                                                                                                L5_1 = true
                                                                                                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                if L1_1 == nil then
                                                                                                                                  L1_1 = string
                                                                                                                                  L1_1 = L1_1.find
                                                                                                                                  L2_1 = L0_1
                                                                                                                                  L3_1 = ",doc.exe"
                                                                                                                                  L4_1 = 1
                                                                                                                                  L5_1 = true
                                                                                                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                  if L1_1 == nil then
                                                                                                                                    L1_1 = string
                                                                                                                                    L1_1 = L1_1.find
                                                                                                                                    L2_1 = L0_1
                                                                                                                                    L3_1 = ".txt.exe"
                                                                                                                                    L4_1 = 1
                                                                                                                                    L5_1 = true
                                                                                                                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                    if L1_1 == nil then
                                                                                                                                      L1_1 = string
                                                                                                                                      L1_1 = L1_1.find
                                                                                                                                      L2_1 = L0_1
                                                                                                                                      L3_1 = ". xlsx.exe"
                                                                                                                                      L4_1 = 1
                                                                                                                                      L5_1 = true
                                                                                                                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                      if L1_1 == nil then
                                                                                                                                        L1_1 = string
                                                                                                                                        L1_1 = L1_1.find
                                                                                                                                        L2_1 = L0_1
                                                                                                                                        L3_1 = ". xls.exe"
                                                                                                                                        L4_1 = 1
                                                                                                                                        L5_1 = true
                                                                                                                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                        if L1_1 == nil then
                                                                                                                                          L1_1 = string
                                                                                                                                          L1_1 = L1_1.find
                                                                                                                                          L2_1 = L0_1
                                                                                                                                          L3_1 = ".eml.exe"
                                                                                                                                          L4_1 = 1
                                                                                                                                          L5_1 = true
                                                                                                                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                          if L1_1 == nil then
                                                                                                                                            L1_1 = string
                                                                                                                                            L1_1 = L1_1.find
                                                                                                                                            L2_1 = L0_1
                                                                                                                                            L3_1 = "pdf.lzh"
                                                                                                                                            L4_1 = 1
                                                                                                                                            L5_1 = true
                                                                                                                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                            if L1_1 == nil then
                                                                                                                                              L1_1 = string
                                                                                                                                              L1_1 = L1_1.find
                                                                                                                                              L2_1 = L0_1
                                                                                                                                              L3_1 = "_pdf.scr"
                                                                                                                                              L4_1 = 1
                                                                                                                                              L5_1 = true
                                                                                                                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                              if L1_1 == nil then
                                                                                                                                                L1_1 = string
                                                                                                                                                L1_1 = L1_1.find
                                                                                                                                                L2_1 = L0_1
                                                                                                                                                L3_1 = "$$.exe"
                                                                                                                                                L4_1 = 1
                                                                                                                                                L5_1 = true
                                                                                                                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                if L1_1 == nil then
                                                                                                                                                  L1_1 = string
                                                                                                                                                  L1_1 = L1_1.find
                                                                                                                                                  L2_1 = L0_1
                                                                                                                                                  L3_1 = ".pdf.exe.7z"
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
                                                                                                                                                      L3_1 = "_xlsx.gz"
                                                                                                                                                      L4_1 = 1
                                                                                                                                                      L5_1 = true
                                                                                                                                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                      if L1_1 == nil then
                                                                                                                                                        L1_1 = string
                                                                                                                                                        L1_1 = L1_1.find
                                                                                                                                                        L2_1 = L0_1
                                                                                                                                                        L3_1 = "_docx.scr"
                                                                                                                                                        L4_1 = 1
                                                                                                                                                        L5_1 = true
                                                                                                                                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                        if L1_1 == nil then
                                                                                                                                                          L1_1 = string
                                                                                                                                                          L1_1 = L1_1.find
                                                                                                                                                          L2_1 = L0_1
                                                                                                                                                          L3_1 = ".pdf.z.exe"
                                                                                                                                                          L4_1 = 1
                                                                                                                                                          L5_1 = true
                                                                                                                                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                          if L1_1 == nil then
                                                                                                                                                            L1_1 = string
                                                                                                                                                            L1_1 = L1_1.find
                                                                                                                                                            L2_1 = L0_1
                                                                                                                                                            L3_1 = "_txt.exe"
                                                                                                                                                            L4_1 = 1
                                                                                                                                                            L5_1 = true
                                                                                                                                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                            if L1_1 == nil then
                                                                                                                                                              L1_1 = string
                                                                                                                                                              L1_1 = L1_1.find
                                                                                                                                                              L2_1 = L0_1
                                                                                                                                                              L3_1 = ".exe.xz"
                                                                                                                                                              L4_1 = 1
                                                                                                                                                              L5_1 = true
                                                                                                                                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                              if L1_1 == nil then
                                                                                                                                                                L1_1 = string
                                                                                                                                                                L1_1 = L1_1.find
                                                                                                                                                                L2_1 = L0_1
                                                                                                                                                                L3_1 = "pdf (1).exe"
                                                                                                                                                                L4_1 = 1
                                                                                                                                                                L5_1 = true
                                                                                                                                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                if L1_1 == nil then
                                                                                                                                                                  L1_1 = string
                                                                                                                                                                  L1_1 = L1_1.find
                                                                                                                                                                  L2_1 = L0_1
                                                                                                                                                                  L3_1 = ".pdf.flk;exe"
                                                                                                                                                                  L4_1 = 1
                                                                                                                                                                  L5_1 = true
                                                                                                                                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                  if L1_1 == nil then
                                                                                                                                                                    L1_1 = string
                                                                                                                                                                    L1_1 = L1_1.find
                                                                                                                                                                    L2_1 = L0_1
                                                                                                                                                                    L3_1 = "_xlsx.exe"
                                                                                                                                                                    L4_1 = 1
                                                                                                                                                                    L5_1 = true
                                                                                                                                                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                    if L1_1 == nil then
                                                                                                                                                                      L1_1 = string
                                                                                                                                                                      L1_1 = L1_1.find
                                                                                                                                                                      L2_1 = L0_1
                                                                                                                                                                      L3_1 = "img.exe"
                                                                                                                                                                      L4_1 = 1
                                                                                                                                                                      L5_1 = true
                                                                                                                                                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                      if L1_1 == nil then
                                                                                                                                                                        L1_1 = string
                                                                                                                                                                        L1_1 = L1_1.find
                                                                                                                                                                        L2_1 = L0_1
                                                                                                                                                                        L3_1 = "_zip.exe"
                                                                                                                                                                        L4_1 = 1
                                                                                                                                                                        L5_1 = true
                                                                                                                                                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                        if L1_1 == nil then
                                                                                                                                                                          L1_1 = string
                                                                                                                                                                          L1_1 = L1_1.find
                                                                                                                                                                          L2_1 = L0_1
                                                                                                                                                                          L3_1 = "_image.scr"
                                                                                                                                                                          L4_1 = 1
                                                                                                                                                                          L5_1 = true
                                                                                                                                                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                          if L1_1 == nil then
                                                                                                                                                                            L1_1 = string
                                                                                                                                                                            L1_1 = L1_1.find
                                                                                                                                                                            L2_1 = L0_1
                                                                                                                                                                            L3_1 = "pdf.bat"
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
                                                                                                                                                                                L3_1 = ".xls.scr"
                                                                                                                                                                                L4_1 = 1
                                                                                                                                                                                L5_1 = true
                                                                                                                                                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                if L1_1 == nil then
                                                                                                                                                                                  L1_1 = string
                                                                                                                                                                                  L1_1 = L1_1.find
                                                                                                                                                                                  L2_1 = L0_1
                                                                                                                                                                                  L3_1 = "txt.exe"
                                                                                                                                                                                  L4_1 = 1
                                                                                                                                                                                  L5_1 = true
                                                                                                                                                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                  if L1_1 == nil then
                                                                                                                                                                                    L1_1 = string
                                                                                                                                                                                    L1_1 = L1_1.find
                                                                                                                                                                                    L2_1 = L0_1
                                                                                                                                                                                    L3_1 = "...exe"
                                                                                                                                                                                    L4_1 = 1
                                                                                                                                                                                    L5_1 = true
                                                                                                                                                                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                    if L1_1 == nil then
                                                                                                                                                                                      L1_1 = string
                                                                                                                                                                                      L1_1 = L1_1.find
                                                                                                                                                                                      L2_1 = L0_1
                                                                                                                                                                                      L3_1 = "upadted quotation sheet.exe"
                                                                                                                                                                                      L4_1 = 1
                                                                                                                                                                                      L5_1 = true
                                                                                                                                                                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                      if L1_1 == nil then
                                                                                                                                                                                        L1_1 = string
                                                                                                                                                                                        L1_1 = L1_1.find
                                                                                                                                                                                        L2_1 = L0_1
                                                                                                                                                                                        L3_1 = ".xlsx.img"
                                                                                                                                                                                        L4_1 = 1
                                                                                                                                                                                        L5_1 = true
                                                                                                                                                                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                        if L1_1 == nil then
                                                                                                                                                                                          L1_1 = string
                                                                                                                                                                                          L1_1 = L1_1.find
                                                                                                                                                                                          L2_1 = L0_1
                                                                                                                                                                                          L3_1 = ". txt.exe"
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
                                                                                                                                                                                              L3_1 = ".tar.exe"
                                                                                                                                                                                              L4_1 = 1
                                                                                                                                                                                              L5_1 = true
                                                                                                                                                                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                              if L1_1 == nil then
                                                                                                                                                                                                L1_1 = string
                                                                                                                                                                                                L1_1 = L1_1.find
                                                                                                                                                                                                L2_1 = L0_1
                                                                                                                                                                                                L3_1 = ".tar.lz.exe"
                                                                                                                                                                                                L4_1 = 1
                                                                                                                                                                                                L5_1 = true
                                                                                                                                                                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                                if L1_1 == nil then
                                                                                                                                                                                                  L1_1 = string
                                                                                                                                                                                                  L1_1 = L1_1.find
                                                                                                                                                                                                  L2_1 = L0_1
                                                                                                                                                                                                  L3_1 = " xls.exe"
                                                                                                                                                                                                  L4_1 = 1
                                                                                                                                                                                                  L5_1 = true
                                                                                                                                                                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                                  if L1_1 == nil then
                                                                                                                                                                                                    L1_1 = string
                                                                                                                                                                                                    L1_1 = L1_1.find
                                                                                                                                                                                                    L2_1 = L0_1
                                                                                                                                                                                                    L3_1 = "_jpeg_image___.exe"
                                                                                                                                                                                                    L4_1 = 1
                                                                                                                                                                                                    L5_1 = true
                                                                                                                                                                                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                                    if L1_1 == nil then
                                                                                                                                                                                                      L1_1 = string
                                                                                                                                                                                                      L1_1 = L1_1.find
                                                                                                                                                                                                      L2_1 = L0_1
                                                                                                                                                                                                      L3_1 = " xlsx.exe"
                                                                                                                                                                                                      L4_1 = 1
                                                                                                                                                                                                      L5_1 = true
                                                                                                                                                                                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                                      if L1_1 == nil then
                                                                                                                                                                                                        L1_1 = string
                                                                                                                                                                                                        L1_1 = L1_1.find
                                                                                                                                                                                                        L2_1 = L0_1
                                                                                                                                                                                                        L3_1 = "_docx.exe"
                                                                                                                                                                                                        L4_1 = 1
                                                                                                                                                                                                        L5_1 = true
                                                                                                                                                                                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                                        if L1_1 == nil then
                                                                                                                                                                                                          L1_1 = string
                                                                                                                                                                                                          L1_1 = L1_1.find
                                                                                                                                                                                                          L2_1 = L0_1
                                                                                                                                                                                                          L3_1 = ".jpeg.img"
                                                                                                                                                                                                          L4_1 = 1
                                                                                                                                                                                                          L5_1 = true
                                                                                                                                                                                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                                          if L1_1 == nil then
                                                                                                                                                                                                            L1_1 = string
                                                                                                                                                                                                            L1_1 = L1_1.find
                                                                                                                                                                                                            L2_1 = L0_1
                                                                                                                                                                                                            L3_1 = "\194\183pdf.scr"
                                                                                                                                                                                                            L4_1 = 1
                                                                                                                                                                                                            L5_1 = true
                                                                                                                                                                                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                                            if L1_1 == nil then
                                                                                                                                                                                                              goto lbl_947
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
::lbl_947::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
