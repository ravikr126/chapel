module LCALSChecksums {
  use LCALSEnums;
  use LCALSDataTypes;

  var ChecksumDom: domain(LoopKernelID);
  var Checksums: [ChecksumDom] 3*real(64);

  /* These are the checksums printed by the C++ reference versions of the LCALS
   * kernels. The computed results must be close to these to be considered
   * correct, but need not be exact matches.
   */

  /*                                        LoopLength.LONG,                    LoopLength.MEDIUM,                  LoopLength.SHORT */
  Checksums[LoopKernelID.PRESSURE_CALC]  = (97197939.191977054695598781108856,  97922407.261323742844979278743267,  97931775.181423720598104409873486);
  Checksums[LoopKernelID.ENERGY_CALC]    = (372002787.49715676010237075388432,  294795950.51371418600319884717464,  293796533.70897553206305019557476);
  Checksums[LoopKernelID.VOL3D_CALC]     = (113027046.04928070683672558516264,  191681058.23907040615449659526348,  195855695.11886116390815004706383);
  Checksums[LoopKernelID.DEL_DOT_VEC_2D] = (371261864.66028437824570573866367,  105951159.62924891436705365777016,  97934476.037522903556236997246742);
  Checksums[LoopKernelID.COUPLE]         = (1047592808.5032690693042241036892,  1060497628.7846160309272818267345,  1077245354.7471187182236462831497);
  Checksums[LoopKernelID.FIR]            = (243259.29826839115715131356409984,  96689036.937513323238817974925041,  97930577.116513883520383387804031);
  Checksums[LoopKernelID.INIT3]          = (-879143257.69492160406662151217461, 375467544.41352021656348370015621,  391708030.68366111544310115277767);
  Checksums[LoopKernelID.MULADDSUB]      = (411278974.87741791378357447683811,  391977288.62174957900424487888813,  391727437.25186200960888527333736);
  Checksums[LoopKernelID.IF_QUAD]        = (-1954669733.3743642342742532491684, 265028140.34296849161910358816385,  293761534.86684716117451898753643);
  Checksums[LoopKernelID.TRAP_INT]       = (0.99999995427519006163663561892463, 0.99999999317889121108748895494500, 0.99999999968835484587259543332038);
  Checksums[LoopKernelID.HYDRO_1D]       = (99765434.003212166120647452771664,  97955255.412347759833210147917271,  97931813.775572069935151375830173);
  Checksums[LoopKernelID.ICCG]           = (1389490600.2742329922039061784744,  1564616666.6310996634420007467270,  1566880711.5563338813371956348419);
  Checksums[LoopKernelID.INNER_PROD]     = (1.0000000000556366064330404697102,  1.0000000000409954292734937553178,  1.0000000000240130137996175108128);
  Checksums[LoopKernelID.BAND_LIN_EQ]    = (97869466.435385706354281865060329,  97924613.377852001896826550364494,  97931399.224420176338753663003445);
  Checksums[LoopKernelID.TRIDIAG_ELIM]   = (17946918.340548690885043470188975,  96908452.554334381376975215971470,  97930582.932531688478775322437286);
  Checksums[LoopKernelID.EOS]            = (230918156.97002684559265617281199,  99633222.149757154344115406274796,  97933785.810354932982590980827808);
  Checksums[LoopKernelID.ADI]            = (25039822872.198205310851335525513,  25069677967.865817423909902572632,  25070064299.818820510059595108032);
  Checksums[LoopKernelID.INT_PREDICT]    = (63390296285.086288750171661376953,  61234036175.529474873095750808716,  61206133216.767081193625926971436);
  Checksums[LoopKernelID.DIFF_PREDICT]   = (41654736990.505872927606105804443,  60956008310.813985101878643035889,  61205808575.203498136252164840698);
  Checksums[LoopKernelID.FIRST_SUM]      = (5763517943050.3090262413024902344,  8437023310.0520892767235636711121,  98266245.038329323870129883289337);
  Checksums[LoopKernelID.FIRST_DIFF]     = (172524.25585586704296758853161009,  96681047.484746506888768635690212,  97930315.643586606573080644011497);
  Checksums[LoopKernelID.PIC_2D]         = (14708141455873757.395507812500000,  15195030160895217.508789062500000,  26446599146459016.976562500000000);
  Checksums[LoopKernelID.PIC_1D]         = (1415332826.2480504550039768218994,  631414729.32156549958745017647743,  677413732.74518284032819792628288);
  Checksums[LoopKernelID.HYDRO_2D]       = (14433713525.873357120901346206665,  14399460506.963620061054825782776,  14395832127.192996755242347717285);
  Checksums[LoopKernelID.GEN_LIN_RECUR]  = (205981484.54102529933152254670858,  99314179.571268169529503211379051,  97933410.737929784809239208698273);
  Checksums[LoopKernelID.DISC_ORD]       = (2715955693584.1506989002227783203,  4126987358.6745561866555362939835,  196023303.25447867214097641408443);
  Checksums[LoopKernelID.MAT_X_MAT]      = (2504678494145.9932248592376708984,  334703747071.83428397774696350098,  97758652332.324997179210186004639);
  Checksums[LoopKernelID.PLANCKIAN]      = (150861031.47946559517004061490297,  98608282.354306093649938702583313,  97932555.571882577190990559756756);
  Checksums[LoopKernelID.IMP_HYDRO_2D]   = (17128640997.592403680086135864258,  6020185880.7030686540529131889343,  4839252917.2536934632807970046997);
  Checksums[LoopKernelID.FIND_FIRST_MIN] = (135961480.71599999070167541503906,  101474692.50000000000000000000000,  83639989.545000001788139343261719);

  config const checksumTolerence = 0.17;
  config const noisyChecksumChecks = false;

  proc checkChecksums(run_variants: [] bool, run_loop: [] bool, run_loop_length: [] bool) {
    var suite_run_info = getLoopSuiteRunInfo();
    for variant in run_variants.domain {
      for loopKernel in chpl_enumerate(LoopKernelID) {
        var stat = suite_run_info.getLoopStats(variant)[loopKernel];
        for length in chpl_enumerate(LoopLength) {
          if run_loop[loopKernel] && stat.loop_is_run && stat.loop_run_count[length] > 0 {
            if run_loop_length[length] {
              const diff = abs(Checksums[loopKernel](1+length:int) - stat.loop_chksum[length]);
              if diff > checksumTolerence {
                writeln((loopKernel, length),
                        " Fail (expected, computed) = ",
                        (Checksums[loopKernel](1+length:int),
                         stat.loop_chksum[length]),
                        " difference: ", diff);
              } else if noisyChecksumChecks {
                writeln((loopKernel, length),
                        " Pass (expected, computed) = ",
                        (Checksums[loopKernel](1+length:int),
                         stat.loop_chksum[length]), " difference: ", diff);
              }
            }
          }
        }
      }
    }
  }
}
