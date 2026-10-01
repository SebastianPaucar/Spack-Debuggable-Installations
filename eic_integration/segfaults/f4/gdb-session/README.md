# f-4 GDB reproduction

Launch command used throughout (crashes deterministically at event 47):

```bash
> gdb -nx \
  -x /repro/combined-gdbinit \
  -ex run \
  --args \
  /root/spack/linux-x86_64_v2/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/bin/eicrecon \
  -Pdd4hep:xml_files="$DETECTOR_COMPACT" \
  -Ppodio:output_file="/repro/debug-out2.eicrecon.edm4eic.root" \
  -Pjana:warmup_timeout=0 \
  -Pjana:timeout=0 \
  "/repro/scratch/960/FULL/26.07.1/epic_craterlake/DIS/pythia8.316-1.0/NC/noRad/ep/10x100/q2_1000toINF/pythia8.316-1.0_NC_noRad_ep_10x100_q2_1000toINF_run000.0115.edm4hep.root"
GNU gdb (GDB) 17.1
Copyright (C) 2025 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-pc-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from /root/spack/linux-x86_64_v2/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/bin/eicrecon...
(No debugging symbols found in /root/spack/linux-x86_64_v2/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/bin/eicrecon)
Starting program: /root/spack/linux-x86_64_v2/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/bin/eicrecon -Pdd4hep:xml_files=/opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/share/epic/epic_craterlake_10x100.xml -Ppodio:output_file=/repro/debug-out2.eicrecon.edm4eic.root -Pjana:warmup_timeout=0 -Pjana:timeout=0 /repro/scratch/960/FULL/26.07.1/epic_craterlake/DIS/pythia8.316-1.0/NC/noRad/ep/10x100/q2_1000toINF/pythia8.316-1.0_NC_noRad_ep_10x100_q2_1000toINF_run000.0115.edm4hep.root
⚠️ warning: Error disabling address space randomization: Operation not permitted
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
[Detaching after vfork from child process 37886]
[Detaching after vfork from child process 37888]
[Detaching after vfork from child process 37890]

15:05:55.936  [warn] Setting signal handler USR1. Use to write status info to the named pipe.
15:05:55.936  [warn] Setting signal handler SIGINT (Ctrl-C). Use a single SIGINT to enter the Inspector, or multiple SIGINTs for an immediate shutdown.
15:05:55.936  [info] JWiringService: No wiring file used
15:05:55.936  [info] Initializing...
15:05:55.936  [info] 
15:05:55.936  [info]        |    \      \  |     \    ___ \   
15:05:55.936  [info]        |   _ \      \ |    _ \      ) |
15:05:55.936  [info]    \   |  ___ \   |\  |   ___ \    __/
15:05:55.936  [info]   \___/ _/    _\ _| \_| _/    _\ _____|
15:05:55.936  [info] 
15:05:55.936  [info]   JANA2 version:   2026.2.0  (unknown git status)
15:05:55.936  [info]   Install prefix:  /opt/software/linux-x86_64_v2/jana2-2026.02.00-l3ovvme7abuvu4qi4jcrlpkmyod4l52n
15:05:55.936  [info]   Optional deps:   Podio ROOT 
15:05:55.936  [info] 
15:05:55.954  [info] Loading plugin 'log' from '/opt/local/lib/EICrecon/plugins/log.so'
15:05:56.320  [info] Loading plugin 'dd4hep' from '/opt/local/lib/EICrecon/plugins/dd4hep.so'
15:05:56.335  [info] Loading plugin 'evaluator' from '/opt/local/lib/EICrecon/plugins/evaluator.so'
15:05:57.988  [info] Loading plugin 'acts' from '/opt/local/lib/EICrecon/plugins/acts.so'
15:05:58.224  [info] Loading plugin 'algorithms_init' from '/opt/local/lib/EICrecon/plugins/algorithms_init.so'
15:05:58.258  [info] Loading plugin 'pid_lut' from '/opt/local/lib/EICrecon/plugins/pid_lut.so'
15:05:58.302  [info] Loading plugin 'richgeo' from '/opt/local/lib/EICrecon/plugins/richgeo.so'
15:05:58.318  [info] Loading plugin 'rootfile' from '/opt/local/lib/EICrecon/plugins/rootfile.so'
15:05:58.356  [info] Loading plugin 'beam' from '/opt/local/lib/EICrecon/plugins/beam.so'
15:05:58.767  [info] Loading plugin 'reco' from '/opt/local/lib/EICrecon/plugins/reco.so'
15:05:58.876  [info] Loading plugin 'tracking' from '/opt/local/lib/EICrecon/plugins/tracking.so'
15:05:58.942  [info] Loading plugin 'particle_flow' from '/opt/local/lib/EICrecon/plugins/particle_flow.so'
15:05:59.013  [info] Loading plugin 'pid' from '/opt/local/lib/EICrecon/plugins/pid.so'
15:05:59.081  [info] Loading plugin 'global_pid_lut' from '/opt/local/lib/EICrecon/plugins/global_pid_lut.so'
15:05:59.274  [info] Loading plugin 'EEMC' from '/opt/local/lib/EICrecon/plugins/EEMC.so'
15:05:59.428  [info] Loading plugin 'BEMC' from '/opt/local/lib/EICrecon/plugins/BEMC.so'
15:05:59.504  [info] Loading plugin 'FEMC' from '/opt/local/lib/EICrecon/plugins/FEMC.so'
[] [dd4hep] [info] Loading DD4hep geometry from 1 files
[] [dd4hep] [info]   - loading geometry file:  '/opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/share/epic/epic_craterlake_10x100.xml' (patience ....)
[] [dd4hep] [info] Geometry successfully loaded.
[] [FEMC] [info] Homogeneous geometry loaded
15:06:20.149  [info] Loading plugin 'EHCAL' from '/opt/local/lib/EICrecon/plugins/EHCAL.so'
15:06:20.218  [info] Loading plugin 'BHCAL' from '/opt/local/lib/EICrecon/plugins/BHCAL.so'
15:06:20.294  [info] Loading plugin 'FHCAL' from '/opt/local/lib/EICrecon/plugins/FHCAL.so'
15:06:20.356  [info] Loading plugin 'B0ECAL' from '/opt/local/lib/EICrecon/plugins/B0ECAL.so'
15:06:20.424  [info] Loading plugin 'ZDC' from '/opt/local/lib/EICrecon/plugins/ZDC.so'
15:06:20.472  [info] Loading plugin 'BTRK' from '/opt/local/lib/EICrecon/plugins/BTRK.so'
15:06:20.519  [info] Loading plugin 'BVTX' from '/opt/local/lib/EICrecon/plugins/BVTX.so'
15:06:20.567  [info] Loading plugin 'PFRICH' from '/opt/local/lib/EICrecon/plugins/PFRICH.so'
15:06:20.618  [info] Loading plugin 'DIRC' from '/opt/local/lib/EICrecon/plugins/DIRC.so'
15:06:20.692  [info] Loading plugin 'DRICH' from '/opt/local/lib/EICrecon/plugins/DRICH.so'
15:06:20.740  [info] Loading plugin 'ECTRK' from '/opt/local/lib/EICrecon/plugins/ECTRK.so'
15:06:20.793  [info] Loading plugin 'MPGD' from '/opt/local/lib/EICrecon/plugins/MPGD.so'
[] [tracking] [info] pixel XML loaded for "InnerMPGDBarrel"
[] [tracking] [info] pixel XML loaded for "MPGDOuterBarrel"
[] [tracking] [info] pixel digitization will be applied to "InnerMPGDBarrel"
[] [tracking] [info] pixel digitization will be applied to "MPGDOuterBarrel"
15:06:20.841  [info] Loading plugin 'B0TRK' from '/opt/local/lib/EICrecon/plugins/B0TRK.so'
15:06:21.026  [info] Loading plugin 'RPOTS' from '/opt/local/lib/EICrecon/plugins/RPOTS.so'
15:06:21.079  [info] Loading plugin 'FOFFMTRK' from '/opt/local/lib/EICrecon/plugins/FOFFMTRK.so'
15:06:21.155  [info] Loading plugin 'BTOF' from '/opt/local/lib/EICrecon/plugins/BTOF.so'
15:06:21.229  [info] Loading plugin 'ECTOF' from '/opt/local/lib/EICrecon/plugins/ECTOF.so'
15:06:21.322  [info] Loading plugin 'LOWQ2' from '/opt/local/lib/EICrecon/plugins/LOWQ2.so'
15:06:21.388  [info] Loading plugin 'LUMISPECCAL' from '/opt/local/lib/EICrecon/plugins/LUMISPECCAL.so'
15:06:21.536  [info] Loading plugin 'podio' from '/opt/local/lib/EICrecon/plugins/podio.so'
15:06:21.557  [info] Loading plugin 'janatop' from '/opt/local/lib/EICrecon/plugins/janatop.so'
15:06:22.830  [warn] Parameter 'EHCAL:HcalEndcapNClustersWithoutShapes:InputTags' has conflicting defaults: 'HcalEndcapNSplitMergeProtoClusters,HcalEndcapNRawHitLinks,HcalEndcapNRawHitAssociations' vs 'HcalEndcapNIslandProtoClusters,HcalEndcapNRawHitLinks,HcalEndcapNRawHitAssociations'
15:06:22.830  [warn] Parameter 'EHCAL:HcalEndcapNClustersWithoutShapes:OutputTags' has conflicting defaults: 'HcalEndcapNSplitMergeClustersWithoutShapes,HcalEndcapNSplitMergeClusterLinksWithoutShapes,HcalEndcapNSplitMergeClusterAssociationsWithoutShapes' vs 'HcalEndcapNClustersWithoutShapes,HcalEndcapNClusterLinksWithoutShapes,HcalEndcapNClusterAssociationsWithoutShapes'
[] [GeoSvc] [info] Initializing geometry service from pre-initialized detector
[] [acts] [info] loading materials map from file: 'calibrations/materials-map.cbor'
[] [acts] [info] Converting DD4Hep geometry to ACTS...
[] [acts] [info] CONV           Translating DD4hep geometry into Acts geometry
[] [acts] [info] CONV           Translating DD4hep sub detector: acts_beampipe_central
[] [acts] [info] CONV           Translating DD4hep sub detector: VertexBarrelSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: InnerSiTrackerSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: MiddleSiBarrelSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: OuterSiBarrelSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: MiddleSiEndcapSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: OuterSiEndcapSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: EndcapMPGDSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: InnerMPGDBarrelSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: EndcapTOFSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: BarrelTOFSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: OuterBarrelMPGDSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: EcalBarrelTrackerSubAssembly
[] [acts] [info] CONV           Translating DD4hep sub detector: B0TrackerSubAssembly
[] [acts] [info] DD4Hep geometry converted!
[] [acts] [info] Checking surfaces...
[] [acts] [info] Loading magnetic field...
[] [acts] [info] ActsGeometryProvider initialization complete
[] [RandomSvc] [info] Custom random seed requested: 1
[] [PIDLookupTableSvc] [info] Loading PID lookup table "calibrations/pfrich.lut"
[] [PIDLookupTableSvc] [info] Loading PID lookup table "calibrations/tof.lut"
[] [PIDLookupTableSvc] [info] Loading PID lookup table "calibrations/hpdirc.lut.gz"
[] [PIDLookupTableSvc] [info] Loading PID lookup table "calibrations/drich.lut.gz"
[] [BEMC:EcalBarrelScFiProtoClusters] [info] Clustering uses localDistXZ with distances <= [80,80]
[] [BEMC:EcalBarrelImagingProtoClusters] [info] Same-layer clustering (same sector and same layer): Global [t, z] distance between hits <= [2.0000 mm, 2.0000 mm].
[] [BEMC:EcalBarrelImagingProtoClusters] [info] Neighbour layers clustering (same sector and layer id within +- 2): Global [eta, phi] distance between hits <= [0.0100, 0.0100 rad].
[] [BEMC:EcalBarrelImagingProtoClusters] [info] Neighbour sectors clustering (different sector): Global distance between hits <= 30.0000 mm.
[] [FEMC:EcalEndcapPIslandProtoClusters] [info] Clustering uses dimScaledLocalDistXY with distances <= [1.5,1.5]
[] [EHCAL:HcalEndcapNIslandProtoClusters] [info] Clustering uses localDistXY with distances <= [150,150]
[] [FHCAL:HcalEndcapPInsertImagingProtoClusters] [info] Same-layer clustering (same sector and same layer): Local [x, y] distance between hits <= [15.5000 mm, 13.4234 mm].
[] [FHCAL:HcalEndcapPInsertImagingProtoClusters] [info] Neighbour layers clustering (same sector and layer id within +- 1): Global [x, y] distance between hits <= [7.7500 mm, 6.7117 mm].
[] [FHCAL:HcalEndcapPInsertImagingProtoClusters] [info] Neighbour sectors clustering (different sector): Global distance between hits <= 100.0000 mm.
[] [B0ECAL:B0ECalIslandProtoClusters] [info] Clustering uses dimScaledLocalDistXY with distances <= [1.8,1.8]
[] [ZDC:EcalFarForwardZDCIslandProtoClusters] [info] Clustering uses localDistXY with distances <= [500,500]
[] [ZDC:HcalFarForwardZDCImagingProtoClusters] [info] Same-layer clustering (same sector and same layer): Local [x, y] distance between hits <= [36.6000 mm, 36.6000 mm].
[] [ZDC:HcalFarForwardZDCImagingProtoClusters] [info] Neighbour layers clustering (same sector and layer id within +- 1): Global [x, y] distance between hits <= [36.6000 mm, 36.6000 mm].
[] [ZDC:HcalFarForwardZDCImagingProtoClusters] [info] Neighbour sectors clustering (different sector): Global distance between hits <= 100.0000 mm.
[] [ZDC:HcalFarForwardZDCIslandProtoClusters] [info] Clustering uses localDistXY with distances <= [26.84,26.84]
[] [ZDC:HcalFarForwardZDCIslandProtoClustersBaseline] [info] Clustering uses localDistXY with distances <= [500,500]
[] [richgeo] [error] ReadoutGeo is not defined for detector 'PFRICH'
15:06:46.030  [info] Creating event pool with level=PhysicsEvent and size=1
15:06:46.057  [info] Created event pool with level=PhysicsEvent and size=1
15:06:46.057  [info] Arrow topology is:
15:06:46.057  [info]   ---------------------------------------------------
15:06:46.057  [info]         Arrow         Parallel  Direction  Place   ID  
15:06:46.057  [info]   ------------------  --------  ---------  ------  --  
15:06:46.057  [info]   PhysicsEventSource     0      Input      Pool    1   
15:06:46.057  [info]                                 Output     Queue   0   
15:06:46.057  [info]   PhysicsEventMap2       1      Input      Queue   0   
15:06:46.057  [info]                                 Output     Pool    1   
15:06:46.057  [info]   ---------------------------------------------------
15:06:46.057  [info] 
15:06:46.057  [warn] To pause processing and inspect, press Ctrl-C.
15:06:46.057  [warn] For a clean shutdown, press Ctrl-C twice.
15:06:46.057  [warn] For a hard shutdown, press Ctrl-C three times.
15:06:46.057  [warn] For worker status information, press Ctrl-Z, or run `jana-status 37883`
15:06:46.057  [info] Initialized JEventSource 'JEventSourcePODIO' ('/repro/scratch/960/FULL/26.07.1/epic_craterlake/DIS/pythia8.316-1.0/NC/noRad/ep/10x100/q2_1000toINF/pythia8.316-1.0_NC_noRad_ep_10x100_q2_1000toINF_run000.0115.edm4hep.root')
[] [JEventProcessorPODIO] [info] Using 'root' backend for output file: /repro/debug-out2.eicrecon.edm4eic.root
15:06:46.126  [info] Initialized JEventProcessor 'JEventProcessorPODIO'
15:06:46.126  [info] Initialized JEventProcessor 'JEventProcessorJANATOP'
15:06:46.126  [info] Configuration Parameters
15:06:46.126  [info] 
15:06:46.126  [info]  - key:         dd4hep:xml_files
15:06:46.126  [info]    value:       /opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/share/epic/epic_craterlake_10x100.xml
15:06:46.126  [info]    default:     /opt/local/share/epic/epic.xml
15:06:46.126  [info]    description: Comma separated list of XML files describing the DD4hep geometry. (Defaults to ${DETECTOR_PATH}/${DETECTOR_CONFIG}.xml using envars.)
15:06:46.126  [info] 
15:06:46.126  [info]  - key:         jana:parameter_strictness
15:06:46.126  [info]    value:       2
15:06:46.126  [info]    default:     1
15:06:46.126  [info]    description: 0: Ignore unused parameters
15:06:46.126  [info]                 1: Warn on unused parameters
15:06:46.126  [info]                 2: Throw on unused parameters
15:06:46.126  [info] 
15:06:46.126  [info]  - key:         jana:timeout
15:06:46.126  [info]    value:       0
15:06:46.126  [info]    default:     8
15:06:46.126  [info]    description: Max time (in seconds) JANA will wait for a thread to update its heartbeat before hard-exiting. 0 to disable timeout completely.
15:06:46.126  [info] 
15:06:46.126  [info]  - key:         jana:warmup_timeout
15:06:46.126  [info]    value:       0
15:06:46.126  [info]    default:     30
15:06:46.126  [info]    description: Max time (in seconds) JANA will wait for 'initial' events to complete before hard-exiting.
15:06:46.126  [info] 
15:06:46.126  [info]  - key:         plugins
15:06:46.126  [info]    value:       log,dd4hep,evaluator,acts,algorithms_init,pid_lut,richgeo,rootfile,beam,reco,tracking,particle_flow,pid,global_pid_lut,EEMC,BEMC,FEMC,EHCAL,BHCAL,FHCAL,B0ECAL,ZDC,BTRK,BVTX,PFRICH,DIRC,DRICH,ECTRK,MPGD,B0TRK,RPOTS,FOFFMTRK,BTOF,ECTOF,LOWQ2,LUMISPECCAL,podio,janatop
15:06:46.126  [info]    default:     
15:06:46.126  [info]    description: Comma-separated list of plugins to load.
15:06:46.126  [info] 
15:06:46.126  [info]  - key:         podio:output_file
15:06:46.126  [info]    value:       /repro/debug-out2.eicrecon.edm4eic.root
15:06:46.126  [info]    default:     podio_output.root
15:06:46.126  [info]    description: Name of EDM4hep/podio output file to write to. Setting this will cause the output file to be created and written to.
15:06:46.126  [info] 
15:06:46.126  [info]  - key:         RECORD_CALL_STACK
15:06:46.127  [info]    value:       1
15:06:46.127  [info]    default:     0
15:06:46.127  [info]    description: Records a trace of who called each factory. Reduces performance but necessary for plugins such as janadot.
15:06:46.127  [warn]    warning:     RECORD_CALL_STACK: Advanced
15:06:46.127  [info] 
15:06:46.127  [warn] Starting processing with 1 threads requested...
[New Thread 0x7f5ccaa1c6c0 (LWP 37898)]
15:06:46.129  [info] Status: 0 events processed at 0.0 Hz (0.0 Hz avg)
[] [JEventSourcePODIO] [info] PODIO version: file=1.7.0 (executable=1.7.0)
[] [JEventSourcePODIO] [info] Opened PODIO file "/repro/scratch/960/FULL/26.07.1/epic_craterlake/DIS/pythia8.316-1.0/NC/noRad/ep/10x100/q2_1000toINF/pythia8.316-1.0_NC_noRad_ep_10x100_q2_1000toINF_run000.0115.edm4hep.root" with 701 events (format auto-detected)
15:06:46.150  [info] Opened JEventSource 'JEventSourcePODIO' ('/repro/scratch/960/FULL/26.07.1/epic_craterlake/DIS/pythia8.316-1.0/NC/noRad/ep/10x100/q2_1000toINF/pythia8.316-1.0_NC_noRad_ep_10x100_q2_1000toINF_run000.0115.edm4hep.root')
[] [B0ECAL:B0ECalIslandProtoClusters] [info] Clustering uses dimScaledLocalDistXY with distances <= [1.8,1.8]
[e:80615] [BEMC:EcalBarrelScFiProtoClusters] [info] Clustering uses localDistXZ with distances <= [80,80]
[e:80615] [BEMC:EcalBarrelImagingProtoClusters] [info] Same-layer clustering (same sector and same layer): Global [t, z] distance between hits <= [2.0000 mm, 2.0000 mm].
[e:80615] [BEMC:EcalBarrelImagingProtoClusters] [info] Neighbour layers clustering (same sector and layer id within +- 2): Global [eta, phi] distance between hits <= [0.0100, 0.0100 rad].
[e:80615] [BEMC:EcalBarrelImagingProtoClusters] [info] Neighbour sectors clustering (different sector): Global distance between hits <= 30.0000 mm.
15:06:46.629  [info] Status: 0 events processed at 0.0 Hz (0.0 Hz avg)
15:06:47.129  [info] Status: 0 events processed at 0.0 Hz (0.0 Hz avg)
[e:80615] [FEMC:EcalEndcapPIslandProtoClusters] [info] Clustering uses dimScaledLocalDistXY with distances <= [1.5,1.5]
[e:80615] [ZDC:EcalFarForwardZDCIslandProtoClusters] [info] Clustering uses localDistXY with distances <= [500,500]
[e:80615] [EHCAL:HcalEndcapNIslandProtoClusters] [info] Clustering uses localDistXY with distances <= [150,150]
[e:80615] [FHCAL:HcalEndcapPInsertImagingProtoClusters] [info] Same-layer clustering (same sector and same layer): Local [x, y] distance between hits <= [15.5000 mm, 13.4234 mm].
[e:80615] [FHCAL:HcalEndcapPInsertImagingProtoClusters] [info] Neighbour layers clustering (same sector and layer id within +- 1): Global [x, y] distance between hits <= [7.7500 mm, 6.7117 mm].
[e:80615] [FHCAL:HcalEndcapPInsertImagingProtoClusters] [info] Neighbour sectors clustering (different sector): Global distance between hits <= 100.0000 mm.
[e:80615] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80615] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
#--------------------------------------------------------------------------
#                         FastJet release 3.5.0
#                 M. Cacciari, G.P. Salam and G. Soyez                  
#     A software package for jet finding and analysis at colliders      
#                           https://fastjet.fr                           
#	                                                                      
# Please cite EPJC72(2012)1896 [arXiv:1111.6097] if you use this package
# for scientific work and optionally PLB641(2006)57 [hep-ph/0512210].   
#                                                                       
# FastJet is provided without warranty under the GNU GPL v2 or higher.  
# It uses T. Chan's closest pair algorithm, S. Fortune's Voronoi code
# and 3rd party plugin jet algorithms. See COPYING file for details.
#--------------------------------------------------------------------------
15:06:47.629  [info] Status: 0 events processed at 0.0 Hz (0.0 Hz avg)
[e:80615] [ZDC:HcalFarForwardZDCImagingProtoClusters] [info] Same-layer clustering (same sector and same layer): Local [x, y] distance between hits <= [36.6000 mm, 36.6000 mm].
[e:80615] [ZDC:HcalFarForwardZDCImagingProtoClusters] [info] Neighbour layers clustering (same sector and layer id within +- 1): Global [x, y] distance between hits <= [36.6000 mm, 36.6000 mm].
[e:80615] [ZDC:HcalFarForwardZDCImagingProtoClusters] [info] Neighbour sectors clustering (different sector): Global distance between hits <= 100.0000 mm.
[e:80615] [ZDC:HcalFarForwardZDCIslandProtoClustersBaseline] [info] Clustering uses localDistXY with distances <= [500,500]
15:06:48.129  [info] Status: 0 events processed at 0.0 Hz (0.0 Hz avg)
15:06:48.629  [info] Status: 1 events processed at 2.0 Hz (0.4 Hz avg)
15:06:49.130  [info] Status: 1 events processed at 0.0 Hz (0.3 Hz avg)
[e:80616] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80616] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:06:49.630  [info] Status: 1 events processed at 0.0 Hz (0.3 Hz avg)
15:06:50.130  [info] Status: 2 events processed at 2.0 Hz (0.5 Hz avg)
15:06:50.630  [info] Status: 2 events processed at 0.0 Hz (0.4 Hz avg)
[e:80617] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80617] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:06:51.130  [info] Status: 2 events processed at 0.0 Hz (0.4 Hz avg)
15:06:51.630  [info] Status: 3 events processed at 2.0 Hz (0.5 Hz avg)
15:06:52.130  [info] Status: 3 events processed at 0.0 Hz (0.5 Hz avg)
15:06:52.630  [info] Status: 3 events processed at 0.0 Hz (0.5 Hz avg)
15:06:53.130  [info] Status: 3 events processed at 0.0 Hz (0.4 Hz avg)
[e:80618] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80618] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:06:53.630  [info] Status: 3 events processed at 0.0 Hz (0.4 Hz avg)
15:06:54.131  [info] Status: 4 events processed at 2.0 Hz (0.5 Hz avg)
[e:80619] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80619] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:06:54.631  [info] Status: 4 events processed at 0.0 Hz (0.5 Hz avg)
15:06:55.131  [info] Status: 5 events processed at 2.0 Hz (0.6 Hz avg)
15:06:55.631  [info] Status: 5 events processed at 0.0 Hz (0.5 Hz avg)
[e:80620] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80620] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:06:56.131  [info] Status: 5 events processed at 0.0 Hz (0.5 Hz avg)
15:06:56.631  [info] Status: 6 events processed at 2.0 Hz (0.6 Hz avg)
15:06:57.131  [info] Status: 6 events processed at 0.0 Hz (0.5 Hz avg)
15:06:57.631  [info] Status: 6 events processed at 0.0 Hz (0.5 Hz avg)
[e:80621] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80621] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:06:58.131  [info] Status: 6 events processed at 0.0 Hz (0.5 Hz avg)
15:06:58.631  [info] Status: 6 events processed at 0.0 Hz (0.5 Hz avg)
15:06:59.131  [info] Status: 7 events processed at 2.0 Hz (0.5 Hz avg)
[e:80622] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80622] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:06:59.632  [info] Status: 7 events processed at 0.0 Hz (0.5 Hz avg)
15:07:00.132  [info] Status: 8 events processed at 2.0 Hz (0.6 Hz avg)
15:07:00.632  [info] Status: 8 events processed at 0.0 Hz (0.6 Hz avg)
[e:80623] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80623] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:01.132  [info] Status: 8 events processed at 0.0 Hz (0.5 Hz avg)
15:07:01.632  [info] Status: 9 events processed at 2.0 Hz (0.6 Hz avg)
[e:80624] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80624] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:02.132  [info] Status: 9 events processed at 0.0 Hz (0.6 Hz avg)
15:07:02.632  [info] Status: 10 events processed at 2.0 Hz (0.6 Hz avg)
15:07:03.132  [info] Status: 10 events processed at 0.0 Hz (0.6 Hz avg)
[e:80625] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80625] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:03.632  [info] Status: 10 events processed at 0.0 Hz (0.6 Hz avg)
15:07:04.132  [info] Status: 10 events processed at 0.0 Hz (0.6 Hz avg)
15:07:04.633  [info] Status: 11 events processed at 2.0 Hz (0.6 Hz avg)
15:07:05.133  [info] Status: 11 events processed at 0.0 Hz (0.6 Hz avg)
[e:80626] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80626] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:05.633  [info] Status: 11 events processed at 0.0 Hz (0.6 Hz avg)
[e:80626] [pid:ChargedParticlesWithAssociations] [error] found CherenkovParticleID object with no hypotheses
15:07:06.133  [info] Status: 12 events processed at 2.0 Hz (0.6 Hz avg)
[e:80627] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80627] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:06.633  [info] Status: 12 events processed at 0.0 Hz (0.6 Hz avg)
15:07:07.133  [info] Status: 12 events processed at 0.0 Hz (0.6 Hz avg)
15:07:07.633  [info] Status: 13 events processed at 2.0 Hz (0.6 Hz avg)
15:07:08.133  [info] Status: 13 events processed at 0.0 Hz (0.6 Hz avg)
15:07:08.633  [info] Status: 13 events processed at 0.0 Hz (0.6 Hz avg)
[e:80628] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80628] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:09.133  [info] Status: 13 events processed at 0.0 Hz (0.6 Hz avg)
15:07:09.633  [info] Status: 14 events processed at 2.0 Hz (0.6 Hz avg)
[e:80629] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80629] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:10.134  [info] Status: 14 events processed at 0.0 Hz (0.6 Hz avg)
15:07:10.634  [info] Status: 14 events processed at 0.0 Hz (0.6 Hz avg)
15:07:11.134  [info] Status: 15 events processed at 2.0 Hz (0.6 Hz avg)
[e:80630] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80630] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:11.634  [info] Status: 15 events processed at 0.0 Hz (0.6 Hz avg)
15:07:12.134  [info] Status: 16 events processed at 2.0 Hz (0.6 Hz avg)
[e:80631] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80631] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:12.634  [info] Status: 16 events processed at 0.0 Hz (0.6 Hz avg)
15:07:13.134  [info] Status: 17 events processed at 2.0 Hz (0.6 Hz avg)
[e:80632] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80632] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:13.634  [info] Status: 17 events processed at 0.0 Hz (0.6 Hz avg)
15:07:14.134  [info] Status: 18 events processed at 2.0 Hz (0.6 Hz avg)
15:07:14.634  [info] Status: 18 events processed at 0.0 Hz (0.6 Hz avg)
[e:80633] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80633] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:15.134  [info] Status: 18 events processed at 0.0 Hz (0.6 Hz avg)
15:07:15.635  [info] Status: 19 events processed at 2.0 Hz (0.6 Hz avg)
[e:80634] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80634] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:16.135  [info] Status: 19 events processed at 0.0 Hz (0.6 Hz avg)
15:07:16.635  [info] Status: 19 events processed at 0.0 Hz (0.6 Hz avg)
15:07:17.135  [info] Status: 20 events processed at 2.0 Hz (0.6 Hz avg)
15:07:17.635  [info] Status: 20 events processed at 0.0 Hz (0.6 Hz avg)
15:07:18.135  [info] Status: 20 events processed at 0.0 Hz (0.6 Hz avg)
15:07:18.635  [info] Status: 20 events processed at 0.0 Hz (0.6 Hz avg)
[e:80635] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80635] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:19.135  [info] Status: 20 events processed at 0.0 Hz (0.6 Hz avg)
15:07:19.635  [info] Status: 20 events processed at 0.0 Hz (0.6 Hz avg)
15:07:20.135  [info] Status: 21 events processed at 2.0 Hz (0.6 Hz avg)
[e:80636] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80636] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:20.635  [info] Status: 21 events processed at 0.0 Hz (0.6 Hz avg)
15:07:21.136  [info] Status: 22 events processed at 2.0 Hz (0.6 Hz avg)
[e:80637] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80637] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:21.636  [info] Status: 22 events processed at 0.0 Hz (0.6 Hz avg)
15:07:22.136  [info] Status: 23 events processed at 2.0 Hz (0.6 Hz avg)
[e:80638] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80638] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:22.636  [info] Status: 23 events processed at 0.0 Hz (0.6 Hz avg)
15:07:23.136  [info] Status: 24 events processed at 2.0 Hz (0.6 Hz avg)
15:07:23.636  [info] Status: 24 events processed at 0.0 Hz (0.6 Hz avg)
[e:80639] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80639] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:24.136  [info] Status: 24 events processed at 0.0 Hz (0.6 Hz avg)
[e:80639] [pid:ChargedParticlesWithAssociations] [error] found CherenkovParticleID object with no hypotheses
15:07:24.636  [info] Status: 25 events processed at 2.0 Hz (0.6 Hz avg)
15:07:25.136  [info] Status: 25 events processed at 0.0 Hz (0.6 Hz avg)
15:07:25.636  [info] Status: 25 events processed at 0.0 Hz (0.6 Hz avg)
15:07:26.136  [info] Status: 25 events processed at 0.0 Hz (0.6 Hz avg)
15:07:26.637  [info] Status: 25 events processed at 0.0 Hz (0.6 Hz avg)
15:07:27.137  [info] Status: 25 events processed at 0.0 Hz (0.6 Hz avg)
[e:80640] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80640] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:27.637  [info] Status: 25 events processed at 0.0 Hz (0.6 Hz avg)
15:07:28.137  [info] Status: 26 events processed at 2.0 Hz (0.6 Hz avg)
15:07:28.637  [info] Status: 26 events processed at 0.0 Hz (0.6 Hz avg)
15:07:29.137  [info] Status: 26 events processed at 0.0 Hz (0.6 Hz avg)
15:07:29.637  [info] Status: 26 events processed at 0.0 Hz (0.6 Hz avg)
[e:80641] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80641] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:30.137  [info] Status: 26 events processed at 0.0 Hz (0.6 Hz avg)
15:07:30.654  [info] Status: 27 events processed at 1.9 Hz (0.6 Hz avg)
15:07:31.154  [info] Status: 27 events processed at 0.0 Hz (0.6 Hz avg)
[e:80642] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80642] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:31.655  [info] Status: 27 events processed at 0.0 Hz (0.6 Hz avg)
15:07:32.155  [info] Status: 28 events processed at 2.0 Hz (0.6 Hz avg)
15:07:32.655  [info] Status: 28 events processed at 0.0 Hz (0.6 Hz avg)
15:07:33.155  [info] Status: 28 events processed at 0.0 Hz (0.6 Hz avg)
15:07:33.655  [info] Status: 28 events processed at 0.0 Hz (0.6 Hz avg)
15:07:34.155  [info] Status: 28 events processed at 0.0 Hz (0.6 Hz avg)
15:07:34.655  [info] Status: 28 events processed at 0.0 Hz (0.6 Hz avg)
[e:80643] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80643] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:35.155  [info] Status: 28 events processed at 0.0 Hz (0.6 Hz avg)
15:07:35.655  [info] Status: 28 events processed at 0.0 Hz (0.6 Hz avg)
15:07:36.155  [info] Status: 29 events processed at 2.0 Hz (0.6 Hz avg)
15:07:36.655  [info] Status: 29 events processed at 0.0 Hz (0.6 Hz avg)
15:07:37.155  [info] Status: 29 events processed at 0.0 Hz (0.6 Hz avg)
[e:80644] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80644] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:37.656  [info] Status: 29 events processed at 0.0 Hz (0.6 Hz avg)
15:07:38.156  [info] Status: 30 events processed at 2.0 Hz (0.6 Hz avg)
[e:80645] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80645] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:38.656  [info] Status: 30 events processed at 0.0 Hz (0.6 Hz avg)
15:07:39.156  [info] Status: 31 events processed at 2.0 Hz (0.6 Hz avg)
15:07:39.656  [info] Status: 31 events processed at 0.0 Hz (0.6 Hz avg)
15:07:40.156  [info] Status: 31 events processed at 0.0 Hz (0.6 Hz avg)
[e:80646] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80646] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:40.656  [info] Status: 32 events processed at 2.0 Hz (0.6 Hz avg)
15:07:41.156  [info] Status: 32 events processed at 0.0 Hz (0.6 Hz avg)
15:07:41.656  [info] Status: 32 events processed at 0.0 Hz (0.6 Hz avg)
[e:80647] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80647] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:42.156  [info] Status: 32 events processed at 0.0 Hz (0.6 Hz avg)
15:07:42.656  [info] Status: 33 events processed at 2.0 Hz (0.6 Hz avg)
15:07:43.157  [info] Status: 33 events processed at 0.0 Hz (0.6 Hz avg)
15:07:43.657  [info] Status: 33 events processed at 0.0 Hz (0.6 Hz avg)
[e:80648] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80648] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:44.157  [info] Status: 33 events processed at 0.0 Hz (0.6 Hz avg)
15:07:44.657  [info] Status: 34 events processed at 2.0 Hz (0.6 Hz avg)
15:07:45.157  [info] Status: 34 events processed at 0.0 Hz (0.6 Hz avg)
[e:80649] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80649] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:45.657  [info] Status: 35 events processed at 2.0 Hz (0.6 Hz avg)
[e:80650] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80650] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:46.157  [info] Status: 35 events processed at 0.0 Hz (0.6 Hz avg)
15:07:46.657  [info] Status: 35 events processed at 0.0 Hz (0.6 Hz avg)
15:07:47.157  [info] Status: 36 events processed at 2.0 Hz (0.6 Hz avg)
[e:80651] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80651] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:47.657  [info] Status: 36 events processed at 0.0 Hz (0.6 Hz avg)
15:07:48.158  [info] Status: 36 events processed at 0.0 Hz (0.6 Hz avg)
15:07:48.658  [info] Status: 37 events processed at 2.0 Hz (0.6 Hz avg)
15:07:49.158  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
15:07:49.658  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
15:07:50.158  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
15:07:50.658  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
15:07:51.158  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
15:07:51.658  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
[e:80652] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80652] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:52.158  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
15:07:52.658  [info] Status: 37 events processed at 0.0 Hz (0.6 Hz avg)
15:07:53.158  [info] Status: 38 events processed at 2.0 Hz (0.6 Hz avg)
15:07:53.658  [info] Status: 38 events processed at 0.0 Hz (0.6 Hz avg)
15:07:54.159  [info] Status: 38 events processed at 0.0 Hz (0.6 Hz avg)
15:07:54.659  [info] Status: 38 events processed at 0.0 Hz (0.6 Hz avg)
[e:80653] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80653] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:55.159  [info] Status: 38 events processed at 0.0 Hz (0.6 Hz avg)
15:07:55.659  [info] Status: 39 events processed at 2.0 Hz (0.6 Hz avg)
15:07:56.159  [info] Status: 39 events processed at 0.0 Hz (0.6 Hz avg)
15:07:56.659  [info] Status: 39 events processed at 0.0 Hz (0.6 Hz avg)
[e:80654] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80654] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:57.159  [info] Status: 39 events processed at 0.0 Hz (0.5 Hz avg)
[e:80655] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80655] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:57.659  [info] Status: 40 events processed at 2.0 Hz (0.6 Hz avg)
15:07:58.159  [info] Status: 40 events processed at 0.0 Hz (0.6 Hz avg)
15:07:58.659  [info] Status: 41 events processed at 2.0 Hz (0.6 Hz avg)
[e:80656] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80656] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:07:59.159  [info] Status: 41 events processed at 0.0 Hz (0.6 Hz avg)
15:07:59.660  [info] Status: 42 events processed at 2.0 Hz (0.6 Hz avg)
15:08:00.160  [info] Status: 42 events processed at 0.0 Hz (0.6 Hz avg)
[e:80657] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80657] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:08:00.660  [info] Status: 42 events processed at 0.0 Hz (0.6 Hz avg)
15:08:01.160  [info] Status: 43 events processed at 2.0 Hz (0.6 Hz avg)
[e:80658] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80658] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:08:01.660  [info] Status: 43 events processed at 0.0 Hz (0.6 Hz avg)
15:08:02.160  [info] Status: 43 events processed at 0.0 Hz (0.6 Hz avg)
15:08:02.660  [info] Status: 44 events processed at 2.0 Hz (0.6 Hz avg)
15:08:03.160  [info] Status: 44 events processed at 0.0 Hz (0.6 Hz avg)
15:08:03.660  [info] Status: 44 events processed at 0.0 Hz (0.6 Hz avg)
15:08:04.160  [info] Status: 44 events processed at 0.0 Hz (0.6 Hz avg)
15:08:04.660  [info] Status: 44 events processed at 0.0 Hz (0.6 Hz avg)
[e:80659] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80659] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:08:05.160  [info] Status: 44 events processed at 0.0 Hz (0.6 Hz avg)
15:08:05.686  [info] Status: 45 events processed at 1.9 Hz (0.6 Hz avg)
15:08:06.186  [info] Status: 45 events processed at 0.0 Hz (0.6 Hz avg)
[e:80660] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80660] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:08:06.686  [info] Status: 45 events processed at 0.0 Hz (0.6 Hz avg)
15:08:07.186  [info] Status: 46 events processed at 2.0 Hz (0.6 Hz avg)
15:08:07.686  [info] Status: 46 events processed at 0.0 Hz (0.6 Hz avg)
[e:80661] [FOFFMTRK:ForwardOffMRecParticles] [error] No matrix found with matching beam momentum
Exception in JFactory::Create, prefix=eicrecon::MatrixTransferStatic_factory
[e:80661] [JEventProcessorPODIO] [error] Omitting PODIO collection 'ForwardOffMRecParticles' due to exception: No matrix found with matching beam momentum.
15:08:08.186  [info] Status: 46 events processed at 0.0 Hz (0.6 Hz avg)
15:08:08.686  [info] Status: 46 events processed at 0.0 Hz (0.6 Hz avg)
15:08:09.186  [info] Status: 47 events processed at 2.0 Hz (0.6 Hz avg)
15:08:09.686  [info] Status: 47 events processed at 0.0 Hz (0.6 Hz avg)
15:08:10.186  [info] Status: 47 events processed at 0.0 Hz (0.6 Hz avg)
15:08:10.687  [info] Status: 47 events processed at 0.0 Hz (0.6 Hz avg)
15:08:11.187  [info] Status: 47 events processed at 0.0 Hz (0.6 Hz avg)
15:08:11.687  [info] Status: 47 events processed at 0.0 Hz (0.5 Hz avg)
15:08:12.187  [info] Status: 47 events processed at 0.0 Hz (0.5 Hz avg)
15:08:12.687  [info] Status: 47 events processed at 0.0 Hz (0.5 Hz avg)
15:08:13.187  [info] Status: 47 events processed at 0.0 Hz (0.5 Hz avg)

Thread 2 "eicrecon" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7f5ccaa1c6c0 (LWP 37898)]
0x00007f5cdb743aac in Acts::detail_vmt::VectorMultiTrajectoryBase::has_impl<Acts::VectorMultiTrajectory const> (instance=..., key=1477579707, istate=37)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/VectorMultiTrajectory.hpp:236
236	        return instance.m_index[istate].ipredicted != kInvalid;
```

Verify that GDB is aware of the DWARF remaps recorded in `/repro/combined-gdbinit`:

```bash
(gdb) show substitute-path
List of all source path substitution rules:
  `./build/src/algorithms/calorimetry' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry'.
  `./build/src/algorithms/digi' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi'.
  `./build/src/algorithms/fardetectors' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors'.
  `./build/src/algorithms/onnx' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/onnx'.
  `./build/src/algorithms/particle_flow' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/particle_flow'.
  `./build/src/algorithms/pid' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid'.
  `./build/src/algorithms/pid_lut' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid_lut'.
  `./build/src/algorithms/reco' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco'.
  `./build/src/algorithms/tracking' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking'.
  `./build/src/benchmarks/reconstruction/femc_studies' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/benchmarks/reconstruction/femc_studies'.
  `./build/src/benchmarks/reconstruction/lfhcal_studies' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/benchmarks/reconstruction/lfhcal_studies'.
  `./build/src/benchmarks/reconstruction/tracking_efficiency' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/benchmarks/reconstruction/tracking_efficiency'.
  `./build/src/benchmarks/reconstruction/tracking_occupancy' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/benchmarks/reconstruction/tracking_occupancy'.
  `./build/src/detectors/B0ECAL' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL'.
  `./build/src/detectors/B0TRK' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK'.
  `./build/src/detectors/BEMC' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC'.
  `./build/src/detectors/BHCAL' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL'.
  `./build/src/detectors/BTOF' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF'.
  `./build/src/detectors/BTRK' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK'.
  `./build/src/detectors/BVTX' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX'.
  `./build/src/detectors/DIRC' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC'.
  `./build/src/detectors/DRICH' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH'.
  `./build/src/detectors/ECTOF' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF'.
  `./build/src/detectors/ECTRK' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK'.
  `./build/src/detectors/EEMC' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC'.
  `./build/src/detectors/EHCAL' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL'.
  `./build/src/detectors/FEMC' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC'.
  `./build/src/detectors/FHCAL' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL'.
  `./build/src/detectors/FOFFMTRK' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK'.
  `./build/src/detectors/LOWQ2' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2'.
  `./build/src/detectors/LUMISPECCAL' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL'.
  `./build/src/detectors/MPGD' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD'.
  `./build/src/detectors/PFRICH' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH'.
  `./build/src/detectors/RPOTS' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS'.
  `./build/src/detectors/ZDC' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC'.
  `./build/src/global/beam' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam'.
  `./build/src/global/particle_flow' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow'.
  `./build/src/global/pid' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid'.
  `./build/src/global/pid_lut' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut'.
  `./build/src/global/reco' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco'.
  `./build/src/global/tracking' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking'.
  `./build/src/services/algorithms_init' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/algorithms_init'.
  `./build/src/services/evaluator' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/evaluator'.
  `./build/src/services/geometry/acts' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/acts'.
  `./build/src/services/geometry/dd4hep' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/dd4hep'.
  `./build/src/services/geometry/richgeo' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo'.
  `./build/src/services/io/podio' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/io/podio'.
  `./build/src/services/log' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/log'.
--Type <RET> for more, q to quit, c to continue without paging--c
  `./build/src/services/particle' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/particle'.
  `./build/src/services/pid_lut' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/pid_lut'.
  `./build/src/services/rootfile' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/rootfile'.
  `./build/src/tests/algorithms_test' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/tests/algorithms_test'.
  `./build/src/tests/geometry_navigation_test' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/tests/geometry_navigation_test'.
  `./build/src/tests/track_propagation_test' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/tests/track_propagation_test'.
  `./build/src/tests/tracking_test' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/tests/tracking_test'.
  `./build/src/utilities/dump_flags' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/utilities/dump_flags'.
  `./build/src/utilities/eicrecon' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/utilities/eicrecon'.
  `./build/src/utilities/janatop' -> `/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/utilities/janatop'.
  `./build/Core' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core'.
  `./build/Examples/Algorithms/AmbiguityResolution' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/AmbiguityResolution'.
  `./build/Examples/Algorithms/Digitization' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Digitization'.
  `./build/Examples/Algorithms/Fatras' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Fatras'.
  `./build/Examples/Algorithms/Geant4' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Geant4'.
  `./build/Examples/Algorithms/Generators' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Generators'.
  `./build/Examples/Algorithms/MaterialMapping' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/MaterialMapping'.
  `./build/Examples/Algorithms/Printers' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Printers'.
  `./build/Examples/Algorithms/Propagation' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Propagation'.
  `./build/Examples/Algorithms/TrackFinding' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/TrackFinding'.
  `./build/Examples/Algorithms/TrackFindingML' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/TrackFindingML'.
  `./build/Examples/Algorithms/TrackFitting' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/TrackFitting'.
  `./build/Examples/Algorithms/TruthTracking' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/TruthTracking'.
  `./build/Examples/Algorithms/Utilities' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Utilities'.
  `./build/Examples/Algorithms/Vertexing' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Algorithms/Vertexing'.
  `./build/Examples/Detectors/Common' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Detectors/Common'.
  `./build/Examples/Detectors/DD4hepDetector' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Detectors/DD4hepDetector'.
  `./build/Examples/Detectors/Geant4Detector' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Detectors/Geant4Detector'.
  `./build/Examples/Detectors/GenericDetector' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Detectors/GenericDetector'.
  `./build/Examples/Detectors/MagneticField' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Detectors/MagneticField'.
  `./build/Examples/Detectors/TGeoDetector' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Detectors/TGeoDetector'.
  `./build/Examples/Detectors/TelescopeDetector' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Detectors/TelescopeDetector'.
  `./build/Examples/Framework' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Framework'.
  `./build/Examples/HelloWorld' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/HelloWorld'.
  `./build/Examples/Io/Csv' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/Csv'.
  `./build/Examples/Io/EDM4hep' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/EDM4hep'.
  `./build/Examples/Io/HepMC3' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/HepMC3'.
  `./build/Examples/Io/Json' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/Json'.
  `./build/Examples/Io/Obj' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/Obj'.
  `./build/Examples/Io/Podio' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/Podio'.
  `./build/Examples/Io/Root' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/Root'.
  `./build/Examples/Io/Svg' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Examples/Io/Svg'.
  `./build/Fatras' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Fatras'.
  `./build/Plugins/ActSVG' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/ActSVG'.
  `./build/Plugins/DD4hep' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep'.
  `./build/Plugins/EDM4hep' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/EDM4hep'.
  `./build/Plugins/FpeMonitoring' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/FpeMonitoring'.
  `./build/Plugins/Geant4' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Geant4'.
  `./build/Plugins/Json' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json'.
  `./build/Plugins/Onnx' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Onnx'.
  `./build/Plugins/Root' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root'.
  `./build/Python/Core' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Python/Core'.
  `./build/Python/Examples' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Python/Examples'.
  `./build/Python/Plugins' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Python/Plugins'.
  `.' -> `/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7'.
```

Inspect the backtrace with full local-variable information:

```bash
(gdb) bt full
#0  Acts::detail_vmt::VectorMultiTrajectoryBase::component_impl<true, Acts::VectorMultiTrajectory const> (instance=..., key=4099663144, istate=37)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/VectorMultiTrajectory.hpp:275
        it = <optimized out>
        col = <optimized out>
#1  0x00007fe31420d731 in Acts::VectorMultiTrajectory::component_impl (this=<optimized out>, key=4099663144, istate=<optimized out>)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/VectorMultiTrajectory.hpp:492
No locals.
#2  Acts::MultiTrajectory<Acts::VectorMultiTrajectory>::component<unsigned int, 4099663144u> (this=<optimized out>, istate=<optimized out>)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/MultiTrajectory.hpp:696
No locals.
#3  Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6ul, false>::component<unsigned int, 4099663144u> (this=0x7fe2c71bc230)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/TrackStateProxy.hpp:674
No locals.
#4  Acts::TrackStateProxyCommon<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6ul, false>, false>::previous (this=0x7fe2c71bc230)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/TrackStateProxyCommon.hpp:71
No locals.
#5  Acts::TrackStateCreator<Acts::SourceLinkAdapterIterator<boost::container::vec_iterator<ActsExamples::IndexSourceLink*, true> >, Acts::TrackContainer<Acts::VectorTrackContainer, Acts::VectorMultiTrajectory, std::shared_ptr> >::processSelectedTrackStates (this=<optimized out>, begin=..., end=..., trackStates=..., isOutlier=false, logger=...)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/TrackFinding/TrackStateCreator.hpp:265
        candidateTrackState = @0x7fe2c71bc230: {<Acts::TrackStateProxyCommon<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, false>> = {<No data fields>}, static ReadOnly = false, 
          m_traj = {m_ptr = 0x0}, m_istate = 37}
        mask = 27
        trackState = {<Acts::TrackStateProxyCommon<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, false>> = {<No data fields>}, static ReadOnly = false, m_traj = {m_ptr = 0x0}, 
          m_istate = 0}
        typeFlags = <optimized out>
        it = {_M_current = 0x7fe2c71bc230}
        resultTrackStateList = <optimized out>
        trackStateList = @0x7fe3034de2e0: {<boost::container::small_vector_base<unsigned int, void, void>> = {<boost::container::vector<unsigned int, boost::container::small_vector_allocator<unsigned int, boost::container::new_allocator<void>, void>, void>> = {
              m_holder = {<boost::container::small_vector_allocator<unsigned int, boost::container::new_allocator<void>, void>> = {<boost::container::new_allocator<unsigned int>> = {<No data fields>}, <No data fields>}, m_start = 0x7fe3034de2f8, m_size = 0, m_capacity = 10}}, <No data fields>}, <boost::container::small_vector_storage<unsigned int, 10, 4>> = {m_storage = {aligner = {
                data = "\001\000\000\000\001", '\000' <repeats 11 times>, "\020\026ށ\nV\000\000\001\000\000\000\000\000\000\000\020\026ށ\nV\000"}, 
              data = "\001\000\000\000\001", '\000' <repeats 11 times>, "\020\026ށ\nV\000\000\001\000\000\000\000\000\000\000\020\026ށ\nV\000"}}, <No data fields>}
        firstTrackState = {<std::_Optional_base<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, true, true>> = {<std::_Optional_base_impl<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, std::_Optional_base<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, true, true> >> = {<No data fields>}, 
            _M_payload = {<std::_Optional_payload_base<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false> >> = {_M_payload = {_M_empty = {<No data fields>}, 
                  _M_value = {<Acts::TrackStateProxyCommon<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, false>> = {<No data fields>}, static ReadOnly = false, m_traj = {
                      m_ptr = <optimized out>}, m_istate = 0}}, 
                _M_engaged = false}, <No data fields>}}, <std::_Enable_copy_move<true, true, true, true, std::optional<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false> > >> = {<No data fields>}, <No data fields>}
        resultTrackStateList = <optimized out>
        trackStateList = <optimized out>
        firstTrackState = <optimized out>
        it = <optimized out>
        candidateTrackState = <optimized out>
        mask = <optimized out>
        trackState = <optimized out>
        typeFlags = <optimized out>
        os = <optimized out>
...
#38 0x00007fe305e52c0c in JOmniFactory<eicrecon::ActsToTracks_factory, eicrecon::NoConfig>::Process (this=0x560a774c8a70, event=...) at ./src/extensions/jana/JOmniFactory.h:543
        input = <optimized out>
        __for_range = @0x560a774c8cf0: {<std::_Vector_base<JOmniFactory<eicrecon::ActsToTracks_factory, eicrecon::NoConfig>::InputBase*, std::allocator<JOmniFactory<eicrecon::ActsToTracks_factory, eicrecon::NoConfig>::InputBase*> >> = {
            _M_impl = {<std::allocator<JOmniFactory<eicrecon::ActsToTracks_factory, eicrecon::NoConfig>::InputBase*>> = {<std::__new_allocator<JOmniFactory<eicrecon::ActsToTracks_factory, eicrecon::NoConfig>::InputBase*>> = {<No data fields>}, <No data fields>}, <std::_Vector_base<JOmniFactory<eicrecon::ActsToTracks_factory, eicrecon::NoConfig>::InputBase*, std::allocator<JOmniFactory<eicrecon::ActsToTracks_factory, eicrecon::NoConfig>::InputBase*> >::_Vector_impl_data> = {_M_start = 0x560a775b6970, _M_finish = 0x560a775b6998, 
                _M_end_of_storage = 0x560a775b69b0}, <No data fields>}}, <No data fields>}
        __for_begin = <optimized out>
        __for_end = <optimized out>
#39 0x00007fe33481afc5 in JFactory::Create(JEvent const&) () from /opt/software/linux-x86_64_v2/jana2-2026.02.00-l3ovvme7abuvu4qi4jcrlpkmyod4l52n/lib/libJANA.so
No symbol table info available.
#40 0x00007fe307cc4c7f in JEvent::GetCollectionBase (this=0x560a8fa56d90, unique_name=..., throw_on_missing=<optimized out>)
    at /opt/software/linux-x86_64_v2/jana2-2026.02.00-l3ovvme7abuvu4qi4jcrlpkmyod4l52n/include/JANA/JEvent.h:520
        cg_entry = {m_call_graph = @0x560a8fa56ef0, m_factory = 0x560a774c8a70}
        fac = 0x560a774c8a70
        bundle = <optimized out>
        typed_bundle = 0x560a8f855e70
#41 0x00007fe303d6674f in JEventProcessorPODIO::Process (this=0x560a43279bf0, event=...) at ./src/services/io/podio/JEventProcessorPODIO.cc:786
        coll_ptr = <optimized out>
        coll = <optimized out>
        __for_range = @0x560a43279ed0: {<std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >> = {
            _M_impl = {<std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >> = {<std::__new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >> = {<No data fields>}, <No data fields>}, <std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_impl_data> = {_M_start = 0x7fe2ea412100, _M_finish = 0x7fe2ea415160, 
                _M_end_of_storage = 0x7fe2ea416100}, <No data fields>}}, <No data fields>}
        __for_begin = <optimized out>
        __for_end = <optimized out>
        successful_collections = {<std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >> = {
            _M_impl = {<std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >> = {<std::__new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >> = {<No data fields>}, <No data fields>}, <std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_impl_data> = {_M_start = 0x7fe2b95de630, _M_finish = 0x7fe2b95de810, 
                _M_end_of_storage = 0x7fe2b95de830}, <No data fields>}}, <No data fields>}
        failed_collections = {_M_t = {
            _M_impl = {<std::allocator<std::_Rb_tree_node<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >> = {<std::__new_allocator<std::_Rb_tree_node<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >> = {<No data fields>}, <No data fields>}, <std::_Rb_tree_key_compare<std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >> = {
                _M_key_compare = {<std::binary_function<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, bool>> = {<No data fields>}, <No data fields>}}, <std::_Rb_tree_header> = {_M_header = {_M_color = std::_S_red, _M_parent = 0x0, _M_left = 0x7fe3034e6e18, _M_right = 0x7fe3034e6e18}, 
                _M_node_count = 0}, <No data fields>}}}
        frame = <optimized out>
#42 0x00007fe334859835 in void jana::components::JComponent::CallWithJExceptionWrapper<JEventProcessor::DoLegacyProcess(std::shared_ptr<JEvent const> const&)::{lambda()#3}>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, JEventProcessor::DoLegacyProcess(std::shared_ptr<JEvent const> const&)::{lambda()#3}) ()
   from /opt/software/linux-x86_64_v2/jana2-2026.02.00-l3ovvme7abuvu4qi4jcrlpkmyod4l52n/lib/libJANA.so
No symbol table info available.
#43 0x00007fe334859cdd in JEventProcessor::DoLegacyProcess(std::shared_ptr<JEvent const> const&) () from /opt/software/linux-x86_64_v2/jana2-2026.02.00-l3ovvme7abuvu4qi4jcrlpkmyod4l52n/lib/libJANA.so
No symbol table info available.
#44 0x00007fe33483d723 in JEventMapArrow::fire(JEvent*, std::array<std::pair<JEvent*, int>, 2ul>&, unsigned long&, JArrow::FireResult&) ()
   from /opt/software/linux-x86_64_v2/jana2-2026.02.00-l3ovvme7abuvu4qi4jcrlpkmyod4l52n/lib/libJANA.so
No symbol table info available.
#45 0x00007fe33482fe2e in JExecutionEngine::RunWorker(JExecutionEngine::Worker) () from /opt/software/linux-x86_64_v2/jana2-2026.02.00-l3ovvme7abuvu4qi4jcrlpkmyod4l52n/lib/libJANA.so
No symbol table info available.
#46 0x00007fe33416c224 in ?? () from /opt/software/linux-x86_64_v2/gcc-runtime-14.2.0-m56uiqkaqqpoi4ncm3vrjwlehuh7cslo/lib/libstdc++.so.6
No symbol table info available.
#47 0x00007fe333ef3b7b in ?? () from /lib/x86_64-linux-gnu/libc.so.6
No symbol table info available.
#48 0x00007fe333f71630 in clone () from /lib/x86_64-linux-gnu/libc.so.6
No symbol table info available.
```

Inspect specific stack `frame`s:

```bash
(gdb) frame 0
#0  Acts::detail_vmt::VectorMultiTrajectoryBase::component_impl<true, Acts::VectorMultiTrajectory const> (instance=..., key=4099663144, istate=37)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/VectorMultiTrajectory.hpp:275
275	        return &instance.m_previous[istate];
(gdb) frame 4
#4  Acts::TrackStateProxyCommon<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6ul, false>, false>::previous (this=0x7fe2c71bc230)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/EventData/TrackStateProxyCommon.hpp:71
71	        .template component<TrackIndexType, detail_tsp::kPreviousKey>();
(gdb) frame 5
#5  Acts::TrackStateCreator<Acts::SourceLinkAdapterIterator<boost::container::vec_iterator<ActsExamples::IndexSourceLink*, true> >, Acts::TrackContainer<Acts::VectorTrackContainer, Acts::VectorMultiTrajectory, std::shared_ptr> >::processSelectedTrackStates (this=<optimized out>, begin=..., end=..., trackStates=..., isOutlier=false, logger=...)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/TrackFinding/TrackStateCreator.hpp:265
265	          trackStates.makeTrackState(mask, candidateTrackState.previous());
(gdb) list 260,285
260	        mask &= ~PM::Filtered;
261	      }
262	
263	      // copy this trackstate into fitted states MultiTrajectory
264	      auto trackState =
265	          trackStates.makeTrackState(mask, candidateTrackState.previous());
266	      ACTS_VERBOSE("Create SourceLink output track state #"
267	                   << trackState.index() << " with mask: " << mask);
268	
269	      if (it != begin) {
270	        // assign indices pointing to first track state
271	        trackState.shareFrom(*firstTrackState, PM::Predicted);
272	        trackState.shareFrom(*firstTrackState, PM::Jacobian);
273	      } else {
274	        firstTrackState = trackState;
275	      }
276	
277	      // either copy ALL or everything except for predicted and jacobian
278	      trackState.copyFrom(candidateTrackState, mask, false);
279	
280	      auto typeFlags = trackState.typeFlags();
281	      typeFlags.setHasParameters();
282	      typeFlags.setHasMeasurement();
283	      if (trackState.referenceSurface().surfaceMaterial() != nullptr) {
284	        typeFlags.setHasMaterial();
285	      }
```

Crash is in `component_impl` called from `.previous()`, at `TrackStateCreator.hpp:265`. The call site corresponds to `TrackStateCreator::processSelectedTrackStates` (`TrackStateCreator.hpp:265` / `:278`), crashing on a `TrackStateProxy` called `candidateTrackState` whose `m_traj` pointer is invalid. Now verify:

```bash
$1 = 37
(gdb) print trackState.m_istate
$2 = 0
(gdb) print candidateTrackState.m_traj.m_ptr == trackState.m_traj.m_ptr
$3 = true
(gdb) print *(Acts::VectorMultiTrajectory*)candidateTrackState.m_traj.m_ptr
annot access memory at address 0x0
(gdb) print &trackStates
$4 = (Acts::TrackStateCreator<Acts::SourceLinkAdapterIterator<boost::container::vec_iterator<ActsExamples::IndexSourceLink*, true> >, Acts::TrackContainer<Acts::VectorTrackContainer, Acts::VectorMultiTrajectory, std::shared_ptr> >::TrackStateContainerBackend *) 0x7fe2d73e0ac0
(gdb) print candidateTrackState.m_traj.m_ptr
$5 = (Acts::MultiTrajectory<Acts::VectorMultiTrajectory> *) 0x0
(gdb) x/4gx 0x7f5c8088ed40
0x7f5c8088ed40: annot access memory at address 0x7f5c8088ed40
```

`candidateTrackState.m_traj.m_ptr` is ` nullptr`, a null trajectory pointer, and `candidateTrackState.previous()` dereferences it, crashing in `component_impl` trying to read `instance.m_previous[istate]` off a null instance. Also, `print &trackStates` and `print candidateTrackState.m_traj.m_ptr` show different addresses, ruling out `makeTrackState` reallocating the container `candidateTrackState` points into. Locate `candidateTrackState`'s origin:

```bash
(gdb) frame 5
#5  Acts::TrackStateCreator<Acts::SourceLinkAdapterIterator<boost::container::vec_iterator<ActsExamples::IndexSourceLink*, true> >, Acts::TrackContainer<Acts::VectorTrackContainer, Acts::VectorMultiTrajectory, std::shared_ptr> >::processSelectedTrackStates (this=<optimized out>, begin=..., end=..., trackStates=..., isOutlier=false, logger=...)
    at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/TrackFinding/TrackStateCreator.hpp:265
265	          trackStates.makeTrackState(mask, candidateTrackState.previous());
(gdb) print it
$9 = {_M_current = 0x7fe2c71bc230}
(gdb) print begin
$10 = {_M_current = 0x7fe2c71bc230}
(gdb) print end
$11 = <optimized out>
(gdb) frame 6
#6  Acts::TrackStateCreator<Acts::SourceLinkAdapterIterator<boost::container::vec_iterator<ActsExamples::IndexSourceLink*, true> >, Acts::TrackContainer<Acts::VectorTrackContainer, Acts::VectorMultiTrajectory, std::shared_ptr> >::createSourceLinkTrackStates (this=<optimized out>, gctx=..., calibrationContext=..., boundState=..., slBegin=..., slEnd=..., prevTip=54, trackStateCandidates=..., 
    trajectory=..., logger=..., surface=...) at /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/include/Acts/TrackFinding/TrackStateCreator.hpp:217
217	      resultTrackStateList = processSelectedTrackStates(
(gdb) print trackStateCandidates
$19 = (std::vector<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, std::allocator<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false> > > &) @0x7fe3034e0890: {<std::_Vector_base<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, std::allocator<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false> > >> = {
    _M_impl = {<std::allocator<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false> >> = {<std::__new_allocator<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false> >> = {<No data fields>}, <No data fields>}, <std::_Vector_base<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, std::allocator<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false> > >::_Vector_impl_data> = {_M_start = 0x7fe2c71bc240, _M_finish = 0x7fe2c71bc250, _M_end_of_storage = 0x7fe2c71bc250}, <No data fields>}}, <No data fields>}
```

It is `*begin`, from a selected sub-range of `trackStateCandidates`. `it == begin == candidateTrackState`'s confirms this is the first element of the selected range. Check:

```bash
(gdb) print sizeof(Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>)
$22 = 16
(gdb) print *(Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>*)0x7fe2c71bc240
$23 = {<Acts::TrackStateProxyCommon<Acts::TrackStateProxy<Acts::VectorMultiTrajectory, 6, false>, false>> = {<No data fields>}, static ReadOnly = false, m_traj = {m_ptr = 0x7fe2d73e0ac0}, 
  m_istate = 55}
(gdb) print (trackStateCandidates._M_impl._M_finish - trackStateCandidates._M_impl._M_start)
$24 = 1 
```

`*begin` does not match `trackStateCandidates`'s actual element 0. `trackStateCandidates[0]` is valid (`m_traj` is the real trajectory object, `m_istate=55`), while `*begin`/`candidateTrackState` (`m_istate=37`, `m_traj=null`) is a different object sitting 16 bytes before the vector's current buffer start. `begin` does not point into `trackStateCandidates`'s current live storage. Now confirm the debuggable-installations  resolves source correctly:

```bash
(gdb) pipe info sources | tr ',' '\n' | grep -c '/root/.spack/debug-sources/'
2232
(gdb) pipe info sources | tr ',' '\n' | grep -c '/root/spack/linux-x86_64_v2/'
392
(gdb) pipe info sources | tr ',' '\n' | grep -c '/opt/software/linux-x86_64_v2/'
15927
```

Three resolution paths: files with DWARF-relative compile directories (resolved via `set substitute-path`); `acts`/`eicrecon`'s `include`  headers with DWARF-absolute paths (left resolvable at their original install location); and third-party dependency headers (`boost`, `eigen`, `JANA2`, `ROOT`, etc., resolved directly, uninvolved in the debuggable-installations mechanism). Filtering the first:

```bash
(gdb) pipe info sources | grep -o '/root/.spack/debug-sources/[^,]*'
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/log.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/log/./src/services/log/log.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/log/./build/src/services/log/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/liblog.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/log/./src/services/log/Log_service.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/log/./src/extensions/spdlog/SpdlogExtensions.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/log/./build/src/services/log/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/dd4hep.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/dd4hep/./src/services/geometry/dd4hep/dd4hep.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/dd4hep/DD4hep_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/dd4hep/./build/src/services/geometry/dd4hep/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/libdd4hep.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/dd4hep/./src/services/geometry/dd4hep/DD4hep_service.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/dd4hep/./build/src/services/geometry/dd4hep/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/dd4hep/DD4hep_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/dd4hep/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/evaluator.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/evaluator/./src/services/evaluator/evaluator.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/evaluator/EvaluatorSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/evaluator/./build/src/services/evaluator/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/libevaluator.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/evaluator/./src/services/evaluator/EvaluatorSvc.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/evaluator/./build/src/services/evaluator/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/evaluator/EvaluatorSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/acts.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/acts/./src/services/geometry/acts/ACTSGeo_service.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/acts/./src/algorithms/tracking/ActsGeometryProvider.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/acts/./build/src/services/geometry/acts/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/acts/ACTSGeo_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/acts/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/acts/./src/services/geometry/acts/acts.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/libalgorithms_tracking.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/CKFTracking.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/extensions/spdlog/SpdlogToActs.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/CKFTracking.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/CKFTrackingConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/ActsGeometryProvider.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./build/src/algorithms/tracking/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/extensions/edm4eic/EDM4eicToActs.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/ActsGeometryProvider.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/ActsToTracks.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/ActsToTracks.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/ActsTrackMerger.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/ActsTrackMerger.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/AmbiguitySolver.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/AmbiguitySolver.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/AmbiguitySolverConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/CKFTrackingFunction.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/IterativeVertexFinder.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/IterativeVertexFinder.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/IterativeVertexFinderConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/LGADHitClustering.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/interfaces/ActsSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/LGADHitClustering.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/LGADHitClusteringConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/MPGDHitReconstruction.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/MPGDHitReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/MPGDHitReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/SecondaryVertexFinder.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/SecondaryVertexFinder.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/SecondaryVertexFinderConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/TrackParamTruthInit.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/TrackParamTruthInit.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/services/particle/ParticleSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/extensions/spdlog/SpdlogFormatters.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/TrackParamTruthInitConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/TrackProjector.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/TrackProjector.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/TrackPropagation.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/TrackPropagationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/TrackPropagation.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/TrackSeeding.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/TrackSeeding.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/SpacePoint.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/OrthogonalTrackSeedingConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/TrackerHitReconstruction.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/TrackerHitReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/TrackerHitReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/TrackerMeasurementFromHits.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/TrackerMeasurementFromHits.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/TracksToParticles.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/TracksToParticles.h
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/symbols/libActsPluginDD4hep.so.debug:
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/./Plugins/DD4hep/src/ConvertDD4hepDetector.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Logger.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryIdentifier.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/SurfaceArrayCreator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/VectorHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryObject.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Visualization/ViewConfig.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/LayerArrayCreator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/include/ActsPlugins/DD4hep/DD4hepConversionHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CylinderVolumeBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/include/ActsPlugins/DD4hep/DD4hepLayerBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/LayerCreator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrackingGeometryBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/PassiveLayerBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CylinderVolumeHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ILayerArrayCreator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrackingVolumeArrayCreator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ITrackingVolumeArrayCreator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/include/ActsPlugins/DD4hep/DD4hepVolumeBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ILayerBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ITrackingGeometryBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Units.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/ContextType.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryContext.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrackingVolume.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Algebra.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinningType.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ITrackingVolumeHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/ISurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/AxisDefinitions.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/OstreamFormatter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ProtoLayer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Direction.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Tolerance.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Common.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Extent.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/RangeXD.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/BoundaryTolerance.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Intersection.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/Surface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/IAxis.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Grid.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinningData.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinUtility.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/SurfaceArray.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Volume.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/Material.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinnedArray.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrackingGeometry.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/AnyGridView.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/MaterialSlab.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/ProtoSurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/IConfinedTrackingVolumeBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/./build/Plugins/DD4hep/<built-in>
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/TGeoAxes.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/include/ActsPlugins/DD4hep/DD4hepMaterialHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/./Plugins/DD4hep/src/DD4hepBinningHelpers.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/ProtoAxis.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/include/ActsPlugins/DD4hep/DD4hepBinningHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Helpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/./Plugins/DD4hep/src/DD4hepMaterialHelpers.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Enumerate.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Layer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/./Plugins/DD4hep/src/DD4hepDetectorElement.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/TGeoDetectorElement.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/include/ActsPlugins/DD4hep/DD4hepDetectorElement.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/SurfacePlacementBase.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/./Plugins/DD4hep/src/DD4hepDetectorSurfaceFactory.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/HomogeneousSurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/include/ActsPlugins/DD4hep/DD4hepDetectorSurfaceFactory.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Polyhedron.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/TGeoMaterialConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/TGeoSurfaceConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/./Plugins/DD4hep/src/DD4hepLayerBuilder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/ThrowAssert.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/TGeoPrimitivesHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/CylinderBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/SurfaceBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/RadialBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/DiscBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/RegularSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Portal.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/NavigationTarget.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/BoundarySurfaceT.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ApproachDescriptor.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Result.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/DiscLayer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CylinderLayer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/./Plugins/DD4hep/src/DD4hepVolumeBuilder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/VolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CylinderVolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/./Plugins/DD4hep/src/DD4hepFieldAdapter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Any.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/MagneticFieldProvider.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/MagneticFieldContext.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/include/ActsPlugins/DD4hep/DD4hepFieldAdapter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/./Plugins/DD4hep/src/BlueprintBuilder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/BlueprintBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/include/ActsPlugins/DD4hep/BlueprintBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/detail/BlueprintBuilder_impl.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ContainerBlueprintNode.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/BlueprintNode.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/FunctionComposition.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Delegate.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Navigation/NavigationDelegate.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/CloneablePtr.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Navigation/NavigationStream.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Navigation/INavigationPolicy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/NavigationPolicyFactory.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/BlueprintOptions.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/StaticBlueprintNode.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/LayerBlueprintNode.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/VolumeAttachmentStrategy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/VolumeResizeStrategy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/VolumeStack.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/GraphViz.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/PortalShell.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/./Plugins/DD4hep/src/OpenDataDetectorBuilder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Blueprint.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/DD4hep/include/ActsPlugins/DD4hep/OpenDataDetectorBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Navigation/SurfaceArrayNavigationPolicy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Navigation/CylinderNavigationPolicy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/symbols/libActsPluginJson.so.debug:
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/AlgebraJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./build/Plugins/Json/<built-in>
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Algebra.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/AlgebraJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/ExtentJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/UtilitiesJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/RangeXD.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Extent.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/AxisDefinitions.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinningType.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Helpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinningData.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/GridJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/GridAccessHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Delegate.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/VectorHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Visualization/ViewConfig.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryObject.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/GridJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Tolerance.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Units.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/Types.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/ContextType.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryContext.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryIdentifier.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/periodic.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Logger.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Intersection.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/SurfaceJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/IAxis.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/GeometryIdentifierJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/GeometryIdentifierJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/OstreamFormatter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/IndexGridNavigationJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Axis.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Polyhedron.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Grid.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/grid_helper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/TransformRange.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/BoundaryTolerance.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/Surface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrackingVolume.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Volume.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/IndexGrid.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/IndexGridNavigationJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Navigation/IndexGridNavigationPolicy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/JsonMaterialDecorator.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/MaterialMapJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/GeometryHierarchyMapJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/JsonMaterialDecorator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/IMaterialDecorator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/ISurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrackingGeometry.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/TrackingGeometryMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/MaterialMapJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/VolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/ProtoVolumeMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/BoundarySurfaceT.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/ProtoSurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryHierarchyMap.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinUtility.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/IVolumeMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Enumerate.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/RadialBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/CylinderBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/AnnulusBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/TrapezoidBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Core/include/Acts/Geometry/Layer.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CylinderVolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CutoutCylinderVolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CuboidVolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Direction.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Common.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/SurfaceBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/RegularSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Layer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/SurfaceArray.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/Material.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinnedArray.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/MaterialSlab.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/RectangleBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/AnyGridView.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/VolumeJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/MaterialJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/MaterialJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/GridSurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/InterpolatedMaterialMap.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/GeometryJsonKeys.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/GridAxisGenerators.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/BinnedSurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/HomogeneousSurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/AccumulatedVolumeMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/TypeList.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/MaterialGridHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/HomogeneousVolumeMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/ProtoAxisJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Holders.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/ProtoAxis.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/ProtoAxisJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/SurfaceBoundsJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/SurfaceBoundsJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/DetrayJsonHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/SurfaceJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/ThrowAssert.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/StrawSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/EllipseBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/PlanarBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/DiscTrapezoidBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/DiscBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/LineBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/ConeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/ConeSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Result.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/CylinderSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/DiscSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/PlaneSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/PerigeeSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/LineSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Alignment.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/TrackParametrization.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/UtilitiesJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/VolumeBoundsJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/VolumeBoundsJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ConeVolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrapezoidVolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GenericCuboidVolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/VolumeJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/AmbiguityConfigJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/AmbiguityResolution/ScoreBasedAmbiguityResolution.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackStateProxyConcept.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/HashedString.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/MultiTrajectory.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackProxyCommon.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackProxyConcept.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/AmbiguityConfigJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/DetrayJsonHelper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/JsonDetectorElement.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/JsonDetectorElement.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/SurfacePlacementBase.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/JsonSurfacesReader.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/JsonSurfacesReader.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/DefinitionsJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Plugins/Json/src/Seeding2ConfigJsonConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/GridBinFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/detail/SpacePointContainer2Column.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/ContainerIterator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/ContainerRange.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/ContainerSubset.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Any.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SourceLink.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SpacePointColumns.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SpacePointContainer2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SpacePointProxy2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SpacePointColumnProxy2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/TypeTraits.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding/SeedConfirmationRangeConfig.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/DoubletSeedFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/TripletSeedFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/BroadTripletSeedFilter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Core/include/Acts/Utilities/GridBinFinder.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/CylindricalSpacePointGrid2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding/BinnedGroup.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/./Core/include/Acts/Seeding/BinnedGroup.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/DefinitionsJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Json/include/ActsPlugins/Json/Seeding2ConfigJsonConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/symbols/libActsPluginRoot.so.debug:
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Plugins/Root/src/RootMaterialDecorator.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Logger.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinningData.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Axis.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/IAxis.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Grid.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/HomogeneousVolumeMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/IVolumeMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryObject.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/VectorHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryIdentifier.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/AxisDefinitions.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/InterpolatedMaterialMap.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/grid_helper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Visualization/ViewConfig.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinUtility.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/RootMaterialMapIo.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/RootMaterialDecorator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Enumerate.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/IMaterialDecorator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./build/Plugins/Root/<built-in>
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Algebra.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/OstreamFormatter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Direction.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/ContextType.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryContext.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Tolerance.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Common.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Extent.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/BoundaryTolerance.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Intersection.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/Surface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/ISurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinningType.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrackingVolume.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Volume.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/Material.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/MaterialSlab.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/TrackingGeometryMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/BinnedSurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/AccumulatedVolumeMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/MaterialGridHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Plugins/Root/src/RootMaterialMapIo.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/HomogeneousSurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/GridAccessHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Plugins/Root/src/RootMaterialTrackIo.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/MaterialInteraction.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/RootMaterialTrackIo.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Plugins/Root/src/RootMagneticFieldIo.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/MagneticFieldContext.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/HashedString.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Any.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Result.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Units.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/InterpolatedBFieldMap.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/MagneticFieldProvider.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/interpolation_impl.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/BFieldMapUtils.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/RootMagneticFieldIo.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Plugins/Root/src/RootMeasurementIo.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/RootMeasurementIo.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/TrackParametrization.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Plugins/Root/src/RootSpacePointIo.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SpacePointContainer2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SpacePointColumns.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SpacePointProxy2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/detail/SpacePointContainer2Column.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SpacePointColumnProxy2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/ContainerIterator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Core/include/Acts/EventData/SpacePointContainer2.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SourceLink.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/ContainerRange.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/ContainerSubset.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/Types.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/TypeTraits.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/RootSpacePointIo.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Plugins/Root/src/TGeoCylinderDiscSplitter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/TGeoDetectorElement.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/TGeoCylinderDiscSplitter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/ITGeoDetectorElementSplitter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/RectangleBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/PlanarBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/SurfaceBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/CylinderBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/RadialBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/TrapezoidBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Plugins/Root/src/TGeoDetectorElement.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/SurfacePlacementBase.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/RangeXD.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Polyhedron.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Helpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/RegularSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/CylinderSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/DiscSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/PlaneSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Alignment.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/TGeoAxes.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/TGeoSurfaceConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Plugins/Root/src/TGeoLayerBuilder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/TGeoLayerBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/TGeoParser.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/SurfaceBinningMatcher.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ILayerBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ProtoLayer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Portal.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/NavigationTarget.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/BoundarySurfaceT.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/LayerCreator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ApproachDescriptor.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ProtoLayerHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Plugins/Root/src/TGeoParser.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/TGeoPrimitivesHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Plugins/Root/src/TGeoPrimitivesHelper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Plugins/Root/src/TGeoSurfaceConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/ConvexPolygonBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/ThrowAssert.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Core/include/Acts/Surfaces/ConvexPolygonBounds.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/periodic.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/DiscBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/AnnulusBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/detail/VerticesHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Plugins/Root/src/HistogramConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Histogram.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/HistogramConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/./Plugins/Root/src/TGeoMaterialConverter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Plugins/Root/include/ActsPlugins/Root/TGeoMaterialConverter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/symbols/libActsCore.so.debug:
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/ActsVersion.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./build/Core/<built-in>
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/ActsVersion.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/EventData/PrintParameters.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryObject.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/VectorHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Visualization/ViewConfig.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/GenericParticleHypothesis.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/Charge.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Algebra.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/TrackParametrization.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/PdgParticle.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Units.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/Types.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Tolerance.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/ContextType.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryContext.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryIdentifier.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/OstreamFormatter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/AxisDefinitions.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Extent.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Logger.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Intersection.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/ParticleHypothesis.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/ParticleData.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/EventData/TrackParameters.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/EventData/TransformationHelpers.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/UnitVectors.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Result.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Common.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/periodic.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/EventData/CorrectedTransformationFreeToBound.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Direction.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/detail/CorrectedTransformationFreeToBound.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TransformationHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/EventData/TrackStatePropMask.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackStatePropMask.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/EventData/VectorMultiTrajectory.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/detail/DynamicColumn.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SourceLink.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Any.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/VectorMultiTrajectory.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Helpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SubspaceHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackStateProxyConcept.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/detail/DynamicKeyIterator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackStateType.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/HashedString.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/TypeTraits.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/MultiTrajectory.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackStateProxyCommon.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackStateProxy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/include/Acts/EventData/TrackStateProxy.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/EventData/VectorTrackContainer.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackProxyCommon.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackProxyConcept.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/VectorTrackContainer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/EventData/TrackParameterHelpers.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/AngleHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/EventData/SeedContainer2.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/detail/SpacePointContainer2Column.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SeedContainer2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SeedProxy2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SeedColumns.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SpacePointContainer2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/ContainerIterator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/ContainerRange.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/ContainerSubset.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SpacePointColumns.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SpacePointProxy2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/SpacePointColumnProxy2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/EventData/SpacePointContainer2.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/EventData/MultiComponentTrackParameters.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFitting/detail/GsfComponentMerging.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/GenericBoundTrackParameters.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/CylinderBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/BoundaryTolerance.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/SurfaceBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/Surface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/RegularSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/MultiComponentTrackParameters.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackParameters.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/CylinderSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/TypeList.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFitting/GsfOptions.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/EventData/Charge.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Definitions/Common.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Definitions/Direction.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Definitions/ParticleData.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/src/Definitions/codegen/1fb06d98eae48c30a60b4c8acb7ebdbee0670524/ParticleDataTable.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Definitions/ParticleIdHelper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/MathHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/AlignablePortalVisitor.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/VolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/detail/AlignablePortalVisitor.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrackingGeometryVisitor.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/StringHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/TransformRange.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/detail/TrackingGeometryPrintVisitor.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinningType.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinningData.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Portal.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrackingVolume.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Volume.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/ConeLayer.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/include/Acts/Geometry/Layer.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/SurfaceArray.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ConeLayer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/ConeSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/RangeXD.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Polyhedron.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/IAxis.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Grid.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Layer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/NavigationTarget.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/BoundarySurfaceT.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ApproachDescriptor.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/ConeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/AnyGridView.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Definitions/Alignment.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/ConeVolumeBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ConeVolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/PlanarBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/ConvexPolygonBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/ThrowAssert.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/RectangleBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/include/Acts/Surfaces/ConvexPolygonBounds.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/include/Acts/Utilities/BoundingBox.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BoundingBox.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/RadialBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/DiscBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/detail/VerticesHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/DiscSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/PlaneSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/CuboidVolumeBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CuboidVolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/BoundarySurfaceFace.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/LineBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/CuboidVolumeBuilder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinnedArrayXD.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/SurfaceArrayCreator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinUtility.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinnedArray.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CuboidVolumeBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ITrackingVolumeBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ProtoLayer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/LayerCreator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/LayerArrayCreator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ILayerArrayCreator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/CutoutCylinderVolumeBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CutoutCylinderVolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/CylinderLayer.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CylinderLayer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/CloneablePtr.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CylinderVolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GenericApproachDescriptor.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/CylinderVolumeBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/CylinderVolumeBuilder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CylinderVolumeBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ITrackingVolumeHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/CylinderVolumeHelper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CylinderVolumeHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/ISurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GlueVolumesDescriptor.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/DiscLayer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/Extent.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/DiscLayer.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/GenericApproachDescriptor.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Enumerate.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/GenericCuboidVolumeBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GenericCuboidVolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Visualization/IVisualization3D.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/GeometryIdentifier.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/GlueVolumesDescriptor.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/Layer.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/Navigator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/LayerArrayCreator.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/NavigationLayer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryObjectSorter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/LayerCreator.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/PlaneLayer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/NavigationLayer.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/PassiveLayerBuilder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/PassiveLayerBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ILayerBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/PlaneLayer.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/Polyhedron.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/ProtoLayer.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/ProtoLayerHelper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ProtoLayerHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/VolumePlacementBase.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/detail/PortalPlacement.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/SurfacePlacementBase.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/VolumePlacementBase.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/SurfaceArrayCreator.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Axis.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/grid_helper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/TrackingGeometry.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/ProtoVolumeMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/IVolumeMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/Material.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrackingGeometry.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/TrackingGeometryBuilder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrackingGeometryBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ITrackingGeometryBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/TrackingVolume.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Delegate.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Navigation/NavigationDelegate.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Navigation/NavigationStream.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Navigation/INavigationPolicy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/TrackingVolumeArrayCreator.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrackingVolumeArrayCreator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ITrackingVolumeArrayCreator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/TrapezoidVolumeBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrapezoidVolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/TrapezoidBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/DiamondVolumeBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/DiamondVolumeBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/DiamondBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/Volume.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/VolumeBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/CylinderVolumeStack.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/VolumeStack.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CylinderVolumeStack.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/VolumeAttachmentStrategy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/VolumeResizeStrategy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/CuboidVolumeStack.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CuboidVolumeStack.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/Portal.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/PortalLinkBase.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrivialPortalLink.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Zip.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CompositePortalLink.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/GridPortalLink.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GridPortalLink.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/GridPortalLinkMerging.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/TrivialPortalLink.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/CompositePortalLink.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/PortalError.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/PortalLinkBase.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/PortalError.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/SurfaceError.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/CylinderPortalShell.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CylinderPortalShell.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/PortalShell.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/CuboidPortalShell.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/CuboidPortalShell.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/BlueprintNode.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ContainerBlueprintNode.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/BlueprintNode.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/NavigationPolicyFactory.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/BlueprintOptions.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/StaticBlueprintNode.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/MaterialDesignatorBlueprintNode.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/LayerBlueprintNode.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryIdentifierBlueprintNode.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/GraphViz.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/Blueprint.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/Blueprint.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/detail/BoundDeduplicator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BoundFactory.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Navigation/MultiNavigationPolicy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Navigation/TryAllNavigationPolicy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/BlueprintOptions.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/StaticBlueprintNode.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/DiamondPortalShell.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/TrapezoidPortalShell.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/LayerBlueprintNode.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/IndexGrid.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/GridAccessHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/MaterialDesignatorBlueprintNode.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/src/Geometry/MaterialDesignator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/ProtoSurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/ProtoAxis.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/MaterialSlab.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/VolumeAttachmentStrategy.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/VolumeResizeStrategy.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/GeometryIdentifierBlueprintNode.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/TrackingGeometryVisitor.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/TrapezoidPortalShell.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/DiamondPortalShell.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/VolumeStack.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/ContainerBlueprintNode.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/MultiWireVolumeBuilder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/MultiWireVolumeBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/IndexGrid.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Navigation/MultiLayerNavigationPolicy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/ReferenceGenerators.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/ReferenceGenerators.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/IReferenceGenerator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/TrackingGeometryPrintVisitor.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/BoundDeduplicator.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/StrawSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/LineSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Geometry/PortalPlacement.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/MagneticField/BFieldMapUtils.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/InterpolatedBFieldMap.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/MagneticFieldProvider.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Interpolation.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/interpolation_impl.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/MagneticFieldContext.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/MagneticFieldError.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/SolenoidBField.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/ToroidField.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/TypeTag.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/MagneticField/SolenoidBField.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/MagneticField/ToroidField.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/MagneticField/MagneticFieldError.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/MagneticField/MultiRangeBField.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/MultiRangeBField.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/MagneticField/TextMagneticFieldIo.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/BFieldMapUtils.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/AccumulatedMaterialSlab.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/AccumulatedMaterialSlab.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/detail/AverageMaterials.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/AccumulatedSurfaceMaterial.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/AccumulatedSurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/BinnedSurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/HomogeneousSurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/AccumulatedVolumeMaterial.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/AccumulatedVolumeMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/AverageMaterials.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/BinnedSurfaceMaterial.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/BinnedSurfaceMaterialAccumulater.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/BinnedSurfaceMaterialAccumulater.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/interface/ISurfaceMaterialAccumulater.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinAdjustment.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/MaterialInteraction.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/interface/IAssignmentFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/GridSurfaceMaterialFactory.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/GridSurfaceMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/GridSurfaceMaterialFactory.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Holders.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/HomogeneousSurfaceMaterial.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/HomogeneousVolumeMaterial.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/HomogeneousVolumeMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/Interactions.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/IntersectionMaterialAssigner.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/IntersectionMaterialAssigner.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/ISurfaceMaterial.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/Material.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/MaterialGridHelper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/MaterialGridHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/MaterialInteractionAssignment.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/GeometryHierarchyMap.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/MaterialInteractionAssignment.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/MaterialMapUtils.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/InterpolatedMaterialMap.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/MaterialMapper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/MaterialMapper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/TrackingGeometryMaterial.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/MaterialSlab.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/MaterialValidater.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/MaterialValidater.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/ProtoVolumeMaterial.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/SurfaceMaterialMapper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/Propagator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/SurfaceMaterialMapper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/CurvilinearSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/PropagatorOptions.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/PropagatorState.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/Extendable.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/SurfaceCollector.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/VolumeCollector.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/include/Acts/Propagator/Propagator.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/StepperOptions.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/ActorList.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/StraightLineStepper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/NavigatorOptions.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/StandardAborters.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/StepperStatistics.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/PropagatorStatistics.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/NavigatorStatistics.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/detail/SteppingHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/ConstrainedStep.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/detail/LoopProtection.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/detail/actor_list_implementation.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/PropagatorResult.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/PropagatorError.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/PropagatorTraits.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Material/VolumeMaterialMapper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/VolumeMaterialMapper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/BinAdjustmentVolume.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Navigation/Navigator.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/NavigatorError.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Navigation/NavigationStream.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Navigation/TryAllNavigationPolicy.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Navigation/SurfaceArrayNavigationPolicy.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Navigation/SurfaceArrayNavigationPolicy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Navigation/CylinderNavigationPolicy.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Navigation/CylinderNavigationPolicy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Navigation/MultiLayerNavigationPolicy.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/detail/IntersectionHelper2D.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Navigation/MultiNavigationPolicy.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Propagator/EigenStepperError.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/EigenStepperError.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Propagator/MultiStepperError.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/MultiStepperError.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Propagator/NavigatorError.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Propagator/SympyStepper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/SympyStepper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/detail/MaterialEffectsAccumulator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/src/Propagator/codegen/4456db4833ffa91027fc4b960af806f0afc991b3/codegen/sympy_stepper_math.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/detail/SympyCovarianceEngine.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Material/Interactions.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Propagator/NavigationTarget.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Propagator/PropagatorError.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Propagator/StraightLineStepper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/detail/CovarianceEngine.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Propagator/detail/MaterialEffectsAccumulator.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Propagator/detail/PointwiseMaterialInteraction.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/detail/PointwiseMaterialInteraction.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Propagator/detail/CovarianceEngine.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/detail/JacobianEngine.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Propagator/detail/JacobianEngine.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Propagator/detail/SympyCovarianceEngine.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/src/Propagator/codegen/4febcacac24eb26d1d1d0e61b83dbc12bbdd79cd/codegen/sympy_cov_math.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Propagator/detail/SympyJacobianEngine.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Propagator/detail/SympyJacobianEngine.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/src/Propagator/codegen/79ce5a7ad1c4f4193db110f5858c7c94f7bc3c10/codegen/sympy_jac_math.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding/EstimateTrackParamsFromSeed.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding/EstimateTrackParamsFromSeed.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding/CompSpacePointAuxiliaries.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/include/Acts/Utilities/detail/Line3DWithPartialDerivatives.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding/detail/CompSpacePointAuxiliaries.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/AlgebraHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/ArrayHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/Line3DWithPartialDerivatives.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/detail/LineHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/CompositeSpacePoint.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding/CompositeSpacePointLineFitter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding/CompositeSpacePointLineFitter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding/detail/FastStrawLineFitter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding/FastStrawLineFitter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding/CompositeSpacePointLineSeeder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding/CompositeSpacePointLineSeeder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding2/detail/CandidatesForMiddleSp2.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/detail/CandidatesForMiddleSp2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding2/BroadTripletSeedFilter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/BroadTripletSeedFilter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/ITripletSeedFilter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/include/Acts/EventData/SpacePointContainer2.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/DoubletSeedFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/TripletSeedFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding/SeedConfirmationRangeConfig.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding2/CylindricalSpacePointGrid2.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/CylindricalSpacePointGrid2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/GridBinFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/include/Acts/Utilities/GridIterator.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding/BinnedGroup.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/include/Acts/Seeding/BinnedGroup.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/include/Acts/Utilities/GridBinFinder.ipp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/GridIterator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding2/CylindricalSpacePointKDTree.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/KDTree.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/CylindricalSpacePointKDTree.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding2/DoubletSeedFinder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding2/TripletSeedFinder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding2/TripletSeeder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/TripletSeeder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding2/GbtsDataStorage.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/GbtsGeometry.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/GbtsDataStorage.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/GbtsConfig.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding2/GbtsGeometry.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/GbtsConnector.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding2/GbtsTrackingFilter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/GbtsTrackingFilter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding2/GraphBasedTrackSeeder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/GraphBasedTrackSeeder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding2/RoiDescriptor.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding2/GbtsConnector.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Seeding2/RoiDescriptor.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/SpacePointFormation2/PixelSpacePointBuilder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/SpacePointFormation2/PixelSpacePointBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/SpacePointFormation2/SpacePointFormationError.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/SpacePointFormation2/SpacePointFormationError.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/SpacePointFormation2/StripSpacePointBuilder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/SpacePointFormation2/StripSpacePointBuilder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/AnnulusBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/AnnulusBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/BoundaryTolerance.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/ConeBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/ConeSurface.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/detail/FacesHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/RealQuadraticEquation.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/detail/AlignmentHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/ConvexPolygonBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/CylinderBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/CylinderSurface.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/SurfaceMergingException.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/detail/MergeHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/DiamondBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/DiscSurface.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/InfiniteBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/detail/PlanarHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/DiscTrapezoidBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/JacobianHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/DiscTrapezoidBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/EllipseBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/EllipseBounds.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/IntersectionHelper2D.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/LineBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/LineSurface.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/PerigeeSurface.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/PerigeeSurface.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/PlaneSurface.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/RadialBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/RectangleBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/StrawSurface.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/Surface.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Geometry/DetectorElementBase.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/SurfaceArray.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/SurfaceBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/SurfaceError.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/TrapezoidBounds.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/detail/VerticesHelper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/RegularSurface.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/CurvilinearSurface.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/detail/AlignmentHelper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/detail/AnnulusBoundsHelper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Surfaces/detail/AnnulusBoundsHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Surfaces/detail/MergeHelper.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFinding/CombinatorialKalmanFilterError.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFinding/CombinatorialKalmanFilterError.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFinding/MeasurementSelector.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFinding/MeasurementSelector.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/MeasurementHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFinding/AmbiguityTrackClustering.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFinding/detail/AmbiguityTrackClustering.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFitting/KalmanFitterError.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFitting/KalmanFitterError.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFitting/GainMatrixUpdater.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/AnyTrackStateProxy.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFitting/GainMatrixUpdater.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFitting/GainMatrixSmoother.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/detail/CovarianceHelper.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackParameterHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFitting/GainMatrixSmoother.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFitting/GlobalChiSquareFitterError.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFitting/GlobalChiSquareFitterError.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFitting/GsfError.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFitting/GsfError.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFitting/GsfUtils.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFitting/BetheHeitlerApprox.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFitting/GsfComponent.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFitting/detail/GsfUtils.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/MultiTrajectoryHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFitting/BetheHeitlerApprox.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFitting/GsfMixtureReduction.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFitting/GlobalChiSquareFitter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFitting/GlobalChiSquareFitter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFitting/MbfSmoother.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFitting/MbfSmoother.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFitting/detail/GsfComponentMerging.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/src/TrackFitting/GainMatrixUpdaterImpl1.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFitting/detail/GainMatrixUpdaterImpl.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/src/TrackFitting/GainMatrixUpdaterImpl2.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/src/TrackFitting/GainMatrixUpdaterImpl3.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/src/TrackFitting/GainMatrixUpdaterImpl4.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/src/TrackFitting/GainMatrixUpdaterImpl5.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/src/TrackFitting/GainMatrixUpdaterImpl6.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Utilities/AnnealingUtility.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/AnnealingUtility.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Utilities/AxisDefinitions.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Utilities/Logger.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Utilities/SpacePointUtility.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/SpacePointFormation/SpacePointBuilderConfig.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/SpacePointFormation/SpacePointBuilderOptions.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/SpacePointUtility.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Utilities/TrackHelpers.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/TrackHelpers.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Utilities/Intersection.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Utilities/IAxis.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Utilities/GraphViz.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/JoinStrings.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Utilities/ProtoAxis.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Utilities/ScopedTimer.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/ScopedTimer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Utilities/TransformComparator.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/TransformComparator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/detail/EigenCompat.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Utilities/Histogram.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Utilities/Histogram.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/AdaptiveGridTrackDensity.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/AdaptiveGridTrackDensity.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/VertexingError.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/KalmanVertexUpdater.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/KalmanVertexUpdater.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/LinearizedTrack.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/TrackAtVertex.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/Vertex.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/KalmanVertexUpdaterImpl3.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/detail/KalmanVertexUpdaterImpl.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/KalmanVertexUpdaterImpl4.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/FsmwMode1dFinder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/FsmwMode1dFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/VertexingError.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/IterativeVertexFinder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/IterativeVertexFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/MagneticField/NullBField.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/ImpactPointEstimator.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/FullBilloirVertexFitter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/IVertexFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/VertexingOptions.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/TrackLinearizer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/AdaptiveMultiVertexFitter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/AdaptiveMultiVertexFitter.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/AMVFInfo.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/AdaptiveGridDensityVertexFinder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/AdaptiveGridDensityVertexFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/ZScanVertexFinder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/ZScanVertexFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/HelicalTrackLinearizer.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/HelicalTrackLinearizer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/LinearizerTrackParameters.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/FullBilloirVertexFitter.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/AdaptiveMultiVertexFinder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/AdaptiveMultiVertexFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/Vertex.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/NumericalTrackLinearizer.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/NumericalTrackLinearizer.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/TrackDensityVertexFinder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/TrackDensityVertexFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/GaussianTrackDensity.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/GaussianTrackDensity.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/ImpactPointEstimator.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/GaussianGridTrackDensity.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/GaussianGridTrackDensity.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/GridDensityVertexFinder.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/GridDensityVertexFinder.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Vertexing/HoughVertexFinder2.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Vertexing/HoughVertexFinder2.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Seeding/HoughTransformUtils.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Visualization/GeometryView3D.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Visualization/GeometryView3D.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Visualization/EventDataView3D.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Visualization/EventDataView3D.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/Visualization/ObjVisualization3D.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/Visualization/ObjVisualization3D.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/AmbiguityResolution/GreedyAmbiguityResolution.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/AmbiguityResolution/GreedyAmbiguityResolution.hpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/AmbiguityResolution/ScoreBasedAmbiguityResolution.cpp
/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/AmbiguityResolution/ScoreBasedAmbiguityResolution.hpp
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/algorithms_init.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/algorithms_init/./src/services/algorithms_init/algorithms_init.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/algorithms_init/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/algorithms_init/./src/algorithms/interfaces/ActsSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/algorithms_init/./src/services/particle/ParticleSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/algorithms_init/./build/src/services/algorithms_init/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/algorithms_init/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/libparticle_service.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/particle/./src/services/particle/ParticleSvc.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/particle/ParticleSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/particle/./build/src/services/particle/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/pid_lut.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/pid_lut/./src/services/pid_lut/pid_lut.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/pid_lut/PIDLookupTable.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/pid_lut/PIDLookupTableSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/pid_lut/./build/src/services/pid_lut/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/libpid_lut.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/pid_lut/./src/services/pid_lut/PIDLookupTable.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/pid_lut/PIDLookupTable.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/pid_lut/./build/src/services/pid_lut/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/richgeo.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/./src/services/geometry/richgeo/richgeo.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/RichGeo_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/./build/src/services/geometry/richgeo/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/./src/algorithms/tracking/TrackPropagationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/ActsGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/ReadoutGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/RichGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/librichgeo.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/./src/services/geometry/richgeo/ActsGeo.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/./src/algorithms/tracking/TrackPropagationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/RichGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/./build/src/services/geometry/richgeo/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/ActsGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/./src/services/geometry/richgeo/IrtGeo.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/IrtGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/./src/services/geometry/richgeo/IrtGeoDRICH.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/IrtGeoDRICH.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/./src/services/geometry/richgeo/IrtGeoPFRICH.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/IrtGeoPFRICH.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/./src/services/geometry/richgeo/ReadoutGeo.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/ReadoutGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/./src/services/geometry/richgeo/RichGeo_service.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/RichGeo_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/geometry/richgeo/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/rootfile.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/rootfile/./src/services/rootfile/rootfile.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/rootfile/RootFile_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/rootfile/./build/src/services/rootfile/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/rootfile/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/beam.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam/./src/global/beam/beam.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam/./src/algorithms/meta/SubDivideCollection.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam/./src/algorithms/meta/CollectionCollector.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam/./src/algorithms/meta/SubDivideCollectionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam/./src/factories/meta/CollectionCollector_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam/./src/factories/meta/SubDivideCollection_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam/./src/algorithms/meta/SubDivideFunctors.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam/./build/src/global/beam/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/beam/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/reco.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/global/reco/reco.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/ChargedReconstructedParticleSelector.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/meta/FilterMatching.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/meta/CollectionCollector.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/MC2ReconstructedParticle_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/MatchClusters_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/InclusiveKinematicsTruth_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/InclusiveKinematicsReconstructed_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/InclusiveKinematicsML_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/ScatteredElectronsTruth_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/ScatteredElectronsEMinusPz_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/TrackClusterMatch_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/FarForwardNeutralsReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/LambdaReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/HadronicFinalState_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/TransformBreitFrame_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/JetReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/UndoAfterBurnerMCParticles_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/PrimaryVertices_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/SecondaryVerticesHelix_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/ClustersToParticles_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/JetReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/services/particle/ParticleSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/FarForwardNeutralsReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/onnx/InclusiveKinematicsMLConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/TrackClusterMatchConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/LambdaReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/ChargedReconstructedParticleSelector_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/meta/FilterMatching_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/JetReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/meta/CollectionCollector_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/factories/reco/ReconstructedElectrons_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/MC2ReconstructedParticle.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/MatchClusters.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/onnx/InclusiveKinematicsML.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/UndoAfterBurner.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/UndoAfterBurnerConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/ClustersToParticles.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/ClustersToParticlesConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/ScatteredElectronsTruth.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/ScatteredElectronsEMinusPz.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/ScatteredElectronsEMinusPzConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/HadronicFinalState.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/TransformBreitFrame.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/FarForwardNeutralsReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/TrackClusterMatch.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/SecondaryVerticesHelix.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/SecondaryVerticesHelixConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/LambdaReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/ElectronReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/ElectronReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/PrimaryVerticesConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/InclusiveKinematicsTruth.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/InclusiveKinematicsElectron.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/InclusiveKinematicsJB.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/InclusiveKinematicsDA.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/InclusiveKinematicsESigma.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/InclusiveKinematicsSigma.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/algorithms/reco/PrimaryVertices.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./build/src/global/reco/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/reco/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/libalgorithms_reco.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/ClustersToParticles.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/ClustersToParticles.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./build/src/algorithms/reco/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/services/particle/ParticleSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/ClustersToParticlesConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/ElectronReconstruction.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/ElectronReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/ElectronReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/FarForwardNeutralsReconstruction.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/FarForwardNeutralsReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/FarForwardNeutralsReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/HadronicFinalState.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/HadronicFinalState.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/Boost.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/Beam.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/Helix.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/Helix.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/InclusiveKinematicsDA.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/InclusiveKinematicsDA.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/InclusiveKinematicsESigma.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/InclusiveKinematicsESigma.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/InclusiveKinematicsElectron.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/InclusiveKinematicsElectron.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/InclusiveKinematicsJB.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/InclusiveKinematicsJB.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/InclusiveKinematicsSigma.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/InclusiveKinematicsSigma.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/InclusiveKinematicsTruth.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/InclusiveKinematicsTruth.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/JetReconstruction.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/JetReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/JetReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/LGADHitCalibration.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/LGADHitCalibration.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/LGADHitCalibrationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/LambdaReconstruction.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/LambdaReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/LambdaReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/MC2ReconstructedParticle.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/MC2ReconstructedParticle.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/MatchClusters.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/MatchClusters.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/PrimaryVertices.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/PrimaryVertices.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/PrimaryVerticesConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/ScatteredElectronsEMinusPz.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/ScatteredElectronsEMinusPz.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/ScatteredElectronsEMinusPzConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/ScatteredElectronsTruth.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/ScatteredElectronsTruth.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/SecondaryVerticesHelix.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/SecondaryVerticesHelix.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/SecondaryVerticesHelixConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/TrackClusterMatch.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/TrackClusterMatch.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/TrackClusterMatchConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/TransformBreitFrame.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/TransformBreitFrame.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/./src/algorithms/reco/UndoAfterBurner.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/UndoAfterBurner.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/reco/UndoAfterBurnerConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/libalgorithms_onnx.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/onnx/./src/algorithms/onnx/CalorimeterParticleIDPostML.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/onnx/CalorimeterParticleIDPostML.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/onnx/./build/src/algorithms/onnx/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/onnx/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/onnx/./src/algorithms/onnx/CalorimeterParticleIDPreML.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/onnx/CalorimeterParticleIDPreML.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/onnx/./src/algorithms/onnx/InclusiveKinematicsML.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/onnx/InclusiveKinematicsML.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/onnx/InclusiveKinematicsMLConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/onnx/./src/algorithms/onnx/ONNXInference.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/onnx/ONNXInference.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/onnx/ONNXInferenceConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/tracking.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/global/tracking/tracking.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/meta/SubDivideCollection.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/meta/CollectionCollector.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/tracking/TrackParamTruthInit_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/tracking/TrackerMeasurementFromHits_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/tracking/TracksToParticles_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/tracking/TrackSeeding_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/tracking/CKFTracking_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/meta/SubDivideFunctors.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/interfaces/ActsSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/CKFTrackingConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/services/particle/ParticleSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/meta/SubDivideCollectionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/TrackPropagationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/meta/CollectionCollector_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/meta/SubDivideCollection_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/tracking/AmbiguitySolver_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/tracking/TrackProjector_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/tracking/TrackPropagation_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/tracking/IterativeVertexFinder_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/tracking/SecondaryVertexFinder_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/TrackPropagation.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/tracking/ActsTrackMerger_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/tracking/ActsToTracks_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/SecondaryVertexFinderConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/TrackProjector.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/AmbiguitySolver.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/AmbiguitySolverConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/ActsToTracks.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/ActsTrackMerger.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/TracksToParticles.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/CKFTracking.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/TrackSeeding.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/OrthogonalTrackSeedingConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/IterativeVertexFinder.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/IterativeVertexFinderConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/SecondaryVertexFinder.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/TrackParamTruthInit.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/TrackParamTruthInitConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/TrackerMeasurementFromHits.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./build/src/global/tracking/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/ActsGeometryProvider.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/particle_flow.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/global/particle_flow/particle_flow.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/algorithms/meta/SubDivideCollection.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/algorithms/meta/CollectionCollector.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/factories/particle_flow/TrackProtoClusterMatchPromoter_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/factories/particle_flow/TrackClusterSubtractor_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/factories/particle_flow/ChargedCandidateMaker_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/services/particle/ParticleSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/algorithms/meta/SubDivideCollectionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/factories/meta/CollectionCollector_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/factories/meta/SubDivideCollection_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/algorithms/particle_flow/TrackProtoClusterMatchPromoter.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/algorithms/particle_flow/ChargedCandidateMaker.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/algorithms/particle_flow/TrackClusterSubtractor.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/algorithms/particle_flow/TrackClusterSubtractorConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./build/src/global/particle_flow/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/particle_flow/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/libalgorithms_particle_flow.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/particle_flow/./src/algorithms/particle_flow/ChargedCandidateMaker.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/particle_flow/ChargedCandidateMaker.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/particle_flow/./src/algorithms/interfaces/CompareObjectID.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/particle_flow/./build/src/algorithms/particle_flow/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/particle_flow/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/particle_flow/./src/algorithms/particle_flow/TrackClusterSubtractor.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/particle_flow/TrackClusterSubtractor.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/particle_flow/TrackClusterSubtractorConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/particle_flow/./src/algorithms/particle_flow/TrackProtoClusterMatchPromoter.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/particle_flow/TrackProtoClusterMatchPromoter.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/pid.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid/./src/global/pid/pid.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid/./src/factories/pid/MatchToRICHPID_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid/./src/algorithms/pid/MatchToRICHPID.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid/./src/algorithms/pid/MatchToRICHPIDConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid/./build/src/global/pid/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/libalgorithms_pid.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/./src/algorithms/pid/IrtCherenkovParticleID.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/Tools.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/IrtCherenkovParticleIDConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/IrtCherenkovParticleID.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/./build/src/algorithms/pid/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/./src/algorithms/pid/MatchToRICHPID.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/MatchToRICHPID.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/ConvertParticleID.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/MatchToRICHPIDConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/./src/algorithms/pid/MergeParticleID.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/MergeParticleID.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/MergeParticleIDConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/./src/algorithms/pid/MergeTracks.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid/MergeTracks.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/global_pid_lut.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./src/global/pid_lut/pid_lut.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./src/algorithms/meta/CollectionCollector.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./src/factories/pid_lut/PIDLookup_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./src/services/particle/ParticleSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./src/algorithms/pid_lut/PIDLookupConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./src/factories/meta/CollectionCollector_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./src/algorithms/pid_lut/PIDLookup.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./build/src/global/pid_lut/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/pid_lut/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/libalgorithms_pid_lut.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid_lut/./src/algorithms/pid_lut/PIDLookup.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid_lut/PIDLookup.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid_lut/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid_lut/PIDLookupConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid_lut/./src/services/pid_lut/PIDLookupTable.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid_lut/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid_lut/./src/services/pid_lut/PIDLookupTableSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/pid_lut/./build/src/algorithms/pid_lut/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/EEMC.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/detectors/EEMC/EEMC.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/calorimetry/CalorimeterClusterRecoCoG.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/calorimetry/CalorimeterClusterShape.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/factories/calorimetry/CalorimeterHitDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/factories/calorimetry/CalorimeterHitReco_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/factories/calorimetry/CalorimeterTruthClustering_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/factories/calorimetry/CalorimeterIslandCluster_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/factories/calorimetry/CalorimeterParticleIDPreML_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/factories/calorimetry/CalorimeterParticleIDPostML_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/factories/calorimetry/TrackClusterMergeSplitter_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/factories/calorimetry/CalorimeterClusterRecoCoG_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/factories/calorimetry/CalorimeterClusterShape_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/calorimetry/CalorimeterClusterRecoCoGConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/calorimetry/CalorimeterClusterShapeConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/onnx/ONNXInferenceConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/calorimetry/CalorimeterIslandClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/calorimetry/CalorimeterHitRecoConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/calorimetry/CalorimeterHitDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/factories/meta/ONNXInference_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/calorimetry/CalorimeterTruthClustering.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/onnx/CalorimeterParticleIDPreML.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/onnx/ONNXInference.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/onnx/CalorimeterParticleIDPostML.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/calorimetry/TrackClusterMergeSplitter.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/calorimetry/TrackClusterMergeSplitterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/calorimetry/CalorimeterIslandCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/calorimetry/CalorimeterHitReco.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/algorithms/calorimetry/CalorimeterHitDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./build/src/detectors/EEMC/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EEMC/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/libalgorithms_calorimetry.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/calorimetry/CalorimeterClusterRecoCoG.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/CalorimeterClusterRecoCoG.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/CalorimeterClusterRecoCoGConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./build/src/algorithms/calorimetry/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/calorimetry/CalorimeterClusterShape.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/CalorimeterClusterShape.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/CalorimeterClusterShapeConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/calorimetry/CalorimeterHitDigi.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/services/evaluator/EvaluatorSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/CalorimeterHitDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/CalorimeterHitDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/calorimetry/CalorimeterHitReco.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/CalorimeterHitReco.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/CalorimeterHitRecoConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/calorimetry/CalorimeterHitsMerger.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/CalorimeterHitsMerger.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/CalorimeterHitsMergerConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/calorimetry/CalorimeterIslandCluster.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/CalorimeterIslandCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/CalorimeterIslandClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/calorimetry/CalorimeterTruthClustering.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/CalorimeterTruthClustering.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/calorimetry/EnergyPositionClusterMerger.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/EnergyPositionClusterMerger.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/EnergyPositionClusterMergerConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/calorimetry/HEXPLIT.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/HEXPLIT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/HEXPLITConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/calorimetry/ImagingClusterReco.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/ImagingClusterReco.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/ClusterTypes.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/ImagingClusterRecoConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/calorimetry/ImagingTopoCluster.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/ImagingTopoCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/ImagingTopoClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/calorimetry/SimCalorimeterHitProcessor.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/SimCalorimeterHitProcessor.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/SimCalorimeterHitProcessorConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/calorimetry/TrackClusterMergeSplitter.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/interfaces/CompareObjectID.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/TrackClusterMergeSplitter.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/TrackClusterMergeSplitterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/./src/algorithms/calorimetry/TruthEnergyPositionClusterMerger.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/calorimetry/TruthEnergyPositionClusterMerger.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/BEMC.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/detectors/BEMC/BEMC.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/CalorimeterClusterRecoCoG.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/CalorimeterClusterShape.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/EnergyPositionClusterMerger.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/ImagingClusterReco.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/TruthEnergyPositionClusterMerger.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/factories/digi/PulseNoise_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/factories/digi/CALOROCDigitization_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/factories/digi/PulseGeneration_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/factories/digi/PulseCombiner_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/factories/calorimetry/CalorimeterIslandCluster_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/factories/calorimetry/CalorimeterClusterRecoCoG_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/factories/calorimetry/SimCalorimeterHitProcessor_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/factories/calorimetry/CalorimeterHitDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/factories/calorimetry/CalorimeterHitReco_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/factories/calorimetry/ImagingTopoCluster_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/factories/calorimetry/ImagingClusterReco_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/factories/calorimetry/CalorimeterClusterShape_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/factories/calorimetry/TruthEnergyPositionClusterMerger_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/factories/calorimetry/EnergyPositionClusterMerger_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/ImagingTopoClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/SimCalorimeterHitProcessorConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/digi/PulseGenerationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/digi/PulseCombinerConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/CalorimeterHitDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/CalorimeterClusterRecoCoGConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/CalorimeterClusterShapeConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/CalorimeterIslandClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/digi/PulseGeneration.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/CalorimeterHitRecoConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/digi/PulseCombiner.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/ImagingTopoCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/ImagingClusterRecoConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/EnergyPositionClusterMergerConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/CalorimeterHitDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/CalorimeterIslandCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/SimCalorimeterHitProcessor.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/calorimetry/CalorimeterHitReco.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/digi/CALOROCDigitizationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/digi/PulseNoiseConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/digi/PulseNoise.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/algorithms/digi/CALOROCDigitization.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./build/src/detectors/BEMC/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BEMC/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/libalgorithms_digi.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./src/algorithms/digi/CALOROCDigitization.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/CALOROCDigitization.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./build/src/algorithms/digi/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/CALOROCDigitizationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./src/algorithms/digi/CFDROCDigitization.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/CFDROCDigitization.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/CFDROCDigitizationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./src/algorithms/digi/EICROCDigitization.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/EICROCDigitization.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/EICROCDigitizationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./src/algorithms/digi/MPGDTrackerDigi.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/MPGDTrackerDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/MPGDTrackerDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./src/algorithms/digi/PhotoMultiplierHitDigi.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/PhotoMultiplierHitDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/PhotoMultiplierHitDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./src/algorithms/digi/PulseCombiner.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/PulseCombiner.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/PulseCombinerConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./src/algorithms/digi/PulseGeneration.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/PulseGeneration.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/PulseGenerationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./src/services/evaluator/EvaluatorSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./src/algorithms/digi/PulseNoise.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/PulseNoise.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/PulseNoiseConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./src/algorithms/digi/SiliconChargeSharing.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/SiliconChargeSharing.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/SiliconChargeSharingConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./src/algorithms/digi/SiliconPulseDiscretization.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/SiliconPulseDiscretization.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/SiliconPulseDiscretizationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/./src/algorithms/digi/SiliconTrackerDigi.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/SiliconTrackerDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/digi/SiliconTrackerDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/FEMC.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/detectors/FEMC/FEMC.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/calorimetry/CalorimeterClusterRecoCoG.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/calorimetry/CalorimeterClusterShape.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/factories/calorimetry/CalorimeterHitDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/factories/calorimetry/CalorimeterHitReco_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/factories/calorimetry/CalorimeterTruthClustering_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/factories/calorimetry/CalorimeterIslandCluster_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/factories/calorimetry/TrackClusterMergeSplitter_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/factories/calorimetry/CalorimeterClusterRecoCoG_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/factories/calorimetry/CalorimeterClusterShape_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/calorimetry/CalorimeterHitRecoConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/calorimetry/CalorimeterHitDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/calorimetry/CalorimeterIslandClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/calorimetry/CalorimeterClusterRecoCoGConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/calorimetry/CalorimeterClusterShapeConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/calorimetry/CalorimeterTruthClustering.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/calorimetry/TrackClusterMergeSplitter.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/calorimetry/TrackClusterMergeSplitterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/calorimetry/CalorimeterIslandCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/calorimetry/CalorimeterHitReco.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/algorithms/calorimetry/CalorimeterHitDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./build/src/detectors/FEMC/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FEMC/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/EHCAL.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/detectors/EHCAL/EHCAL.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/CalorimeterClusterRecoCoG.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/CalorimeterClusterShape.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/factories/calorimetry/CalorimeterHitDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/factories/calorimetry/CalorimeterHitReco_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/factories/calorimetry/CalorimeterHitsMerger_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/factories/calorimetry/CalorimeterTruthClustering_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/factories/calorimetry/CalorimeterIslandCluster_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/factories/calorimetry/TrackClusterMergeSplitter_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/factories/calorimetry/CalorimeterClusterRecoCoG_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/factories/calorimetry/CalorimeterClusterShape_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/CalorimeterHitsMergerConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/CalorimeterClusterRecoCoGConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/CalorimeterClusterShapeConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/CalorimeterIslandClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/CalorimeterHitRecoConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/CalorimeterHitDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/CalorimeterTruthClustering.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/TrackClusterMergeSplitter.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/TrackClusterMergeSplitterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/CalorimeterHitReco.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/CalorimeterHitsMerger.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/CalorimeterIslandCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/algorithms/calorimetry/CalorimeterHitDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./build/src/detectors/EHCAL/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/EHCAL/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/BHCAL.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/detectors/BHCAL/BHCAL.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/CalorimeterClusterRecoCoG.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/CalorimeterClusterShape.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/factories/calorimetry/CalorimeterHitDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/factories/calorimetry/CalorimeterHitReco_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/factories/calorimetry/CalorimeterHitsMerger_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/factories/calorimetry/CalorimeterTruthClustering_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/factories/calorimetry/CalorimeterIslandCluster_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/factories/calorimetry/TrackClusterMergeSplitter_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/factories/calorimetry/CalorimeterClusterRecoCoG_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/factories/calorimetry/CalorimeterClusterShape_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/CalorimeterHitsMergerConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/CalorimeterClusterRecoCoGConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/CalorimeterClusterShapeConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/CalorimeterIslandClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/CalorimeterHitRecoConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/CalorimeterHitDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/CalorimeterTruthClustering.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/TrackClusterMergeSplitter.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/TrackClusterMergeSplitterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/CalorimeterHitReco.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/CalorimeterHitsMerger.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/CalorimeterIslandCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/algorithms/calorimetry/CalorimeterHitDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./build/src/detectors/BHCAL/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BHCAL/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/FHCAL.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/detectors/FHCAL/FHCAL.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/CalorimeterClusterRecoCoG.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/CalorimeterClusterShape.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/factories/calorimetry/CalorimeterHitsMerger_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/factories/calorimetry/HEXPLIT_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/factories/calorimetry/ImagingTopoCluster_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/factories/calorimetry/CalorimeterHitDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/factories/calorimetry/CalorimeterHitReco_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/factories/calorimetry/CalorimeterTruthClustering_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/factories/calorimetry/CalorimeterIslandCluster_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/factories/calorimetry/TrackClusterMergeSplitter_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/factories/calorimetry/CalorimeterClusterRecoCoG_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/factories/calorimetry/CalorimeterClusterShape_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/ImagingTopoClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/CalorimeterHitsMergerConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/CalorimeterClusterRecoCoGConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/CalorimeterClusterShapeConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/CalorimeterIslandClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/HEXPLIT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/CalorimeterHitRecoConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/CalorimeterHitDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/ImagingTopoCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/CalorimeterTruthClustering.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/TrackClusterMergeSplitter.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/TrackClusterMergeSplitterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/CalorimeterHitsMerger.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/HEXPLITConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/CalorimeterHitReco.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/CalorimeterIslandCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/algorithms/calorimetry/CalorimeterHitDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./build/src/detectors/FHCAL/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FHCAL/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/B0ECAL.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/detectors/B0ECAL/B0ECAL.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/algorithms/calorimetry/CalorimeterClusterRecoCoG.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/algorithms/calorimetry/CalorimeterClusterShape.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/factories/calorimetry/CalorimeterHitDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/factories/calorimetry/CalorimeterHitReco_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/factories/calorimetry/CalorimeterTruthClustering_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/factories/calorimetry/CalorimeterIslandCluster_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/factories/calorimetry/CalorimeterClusterRecoCoG_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/factories/calorimetry/CalorimeterClusterShape_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/algorithms/calorimetry/CalorimeterClusterRecoCoGConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/algorithms/calorimetry/CalorimeterClusterShapeConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/algorithms/calorimetry/CalorimeterIslandClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/algorithms/calorimetry/CalorimeterHitRecoConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/algorithms/calorimetry/CalorimeterHitDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/algorithms/calorimetry/CalorimeterTruthClustering.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/algorithms/calorimetry/CalorimeterIslandCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/algorithms/calorimetry/CalorimeterHitReco.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/algorithms/calorimetry/CalorimeterHitDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./build/src/detectors/B0ECAL/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0ECAL/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/ZDC.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/detectors/ZDC/ZDC.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/CalorimeterClusterRecoCoG.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/CalorimeterClusterShape.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/factories/calorimetry/CalorimeterHitDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/factories/calorimetry/CalorimeterHitReco_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/factories/calorimetry/HEXPLIT_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/factories/calorimetry/ImagingTopoCluster_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/factories/calorimetry/CalorimeterTruthClustering_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/factories/calorimetry/CalorimeterIslandCluster_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/factories/calorimetry/CalorimeterClusterRecoCoG_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/factories/calorimetry/CalorimeterClusterShape_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/ImagingTopoClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/CalorimeterHitDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/CalorimeterClusterRecoCoGConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/CalorimeterClusterShapeConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/CalorimeterIslandClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/HEXPLIT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/CalorimeterHitRecoConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/ImagingTopoCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/CalorimeterTruthClustering.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/CalorimeterHitReco.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/HEXPLITConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/CalorimeterIslandCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/algorithms/calorimetry/CalorimeterHitDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./build/src/detectors/ZDC/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ZDC/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/BTRK.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK/./src/detectors/BTRK/BTRK.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK/./src/factories/digi/SiliconTrackerDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK/./src/factories/tracking/TrackerHitReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK/./src/algorithms/digi/SiliconTrackerDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK/./src/algorithms/digi/SiliconTrackerDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK/./src/algorithms/tracking/TrackerHitReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK/./src/algorithms/tracking/TrackerHitReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK/./build/src/detectors/BTRK/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTRK/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/BVTX.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX/./src/detectors/BVTX/BVTX.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX/./src/factories/digi/SiliconTrackerDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX/./src/factories/tracking/TrackerHitReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX/./src/algorithms/digi/SiliconTrackerDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX/./src/algorithms/digi/SiliconTrackerDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX/./src/algorithms/tracking/TrackerHitReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX/./src/algorithms/tracking/TrackerHitReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX/./build/src/detectors/BVTX/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BVTX/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/PFRICH.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./src/detectors/PFRICH/PFRICH.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./src/factories/digi/PhotoMultiplierHitDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./src/algorithms/digi/PhotoMultiplierHitDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./src/algorithms/digi/PhotoMultiplierHitDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./src/services/geometry/richgeo/ReadoutGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./build/src/detectors/PFRICH/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./src/services/geometry/richgeo/ActsGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./src/services/geometry/richgeo/RichGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/PFRICH/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/DIRC.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./src/detectors/DIRC/DIRC.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./src/factories/digi/PhotoMultiplierHitDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./src/algorithms/digi/PhotoMultiplierHitDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./src/algorithms/digi/PhotoMultiplierHitDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./src/services/geometry/richgeo/ReadoutGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./build/src/detectors/DIRC/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./src/services/geometry/richgeo/ActsGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./src/services/geometry/richgeo/RichGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DIRC/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/DRICH.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/detectors/DRICH/DRICH.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/services/geometry/richgeo/RichGeo_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/factories/digi/PhotoMultiplierHitDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/factories/pid/IrtCherenkovParticleID_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/algorithms/digi/PhotoMultiplierHitDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/algorithms/pid/IrtCherenkovParticleIDConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/algorithms/digi/PhotoMultiplierHitDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/algorithms/interfaces/ActsSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/services/particle/ParticleSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/services/geometry/richgeo/ReadoutGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/algorithms/tracking/TrackPropagationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/factories/pid/MergeTrack_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/factories/pid/MergeCherenkovParticleID_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/factories/pid/RichTrack_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/algorithms/pid/MergeTracks.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/algorithms/tracking/TrackPropagation.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/algorithms/pid/IrtCherenkovParticleID.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/algorithms/pid/MergeParticleID.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/algorithms/pid/MergeParticleIDConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/services/geometry/richgeo/IrtGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./build/src/detectors/DRICH/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/services/geometry/richgeo/ActsGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/services/geometry/richgeo/RichGeo.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/DRICH/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/ECTRK.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK/./src/detectors/ECTRK/ECTRK.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK/./src/factories/digi/SiliconTrackerDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK/./src/factories/tracking/TrackerHitReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK/./src/algorithms/digi/SiliconTrackerDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK/./src/algorithms/digi/SiliconTrackerDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK/./src/algorithms/tracking/TrackerHitReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK/./src/algorithms/tracking/TrackerHitReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK/./build/src/detectors/ECTRK/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTRK/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/MPGD.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/detectors/MPGD/MPGD.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/factories/tracking/MPGDHitReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/factories/tracking/TrackerHitReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/factories/digi/MPGDTrackerDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/factories/digi/SiliconTrackerDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/algorithms/digi/MPGDTrackerDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/algorithms/tracking/MPGDHitReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/algorithms/digi/MPGDTrackerDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/algorithms/digi/SiliconTrackerDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/algorithms/digi/SiliconTrackerDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/algorithms/tracking/MPGDHitReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/algorithms/tracking/TrackerHitReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/algorithms/tracking/TrackerHitReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./build/src/detectors/MPGD/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/MPGD/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/B0TRK.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK/./src/detectors/B0TRK/B0TRK.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK/./src/factories/digi/SiliconTrackerDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK/./src/factories/tracking/TrackerHitReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK/./src/algorithms/digi/SiliconTrackerDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK/./src/algorithms/digi/SiliconTrackerDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK/./src/algorithms/tracking/TrackerHitReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK/./src/algorithms/tracking/TrackerHitReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK/./build/src/detectors/B0TRK/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/B0TRK/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/RPOTS.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/detectors/RPOTS/RPOTS.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/factories/digi/SiliconTrackerDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/factories/tracking/TrackerHitReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/factories/fardetectors/PolynomialMatrixReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/factories/fardetectors/MatrixTransferStatic_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/algorithms/fardetectors/MatrixTransferStaticConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/algorithms/fardetectors/PolynomialMatrixReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/algorithms/digi/SiliconTrackerDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/algorithms/digi/SiliconTrackerDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/algorithms/fardetectors/MatrixTransferStatic.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/algorithms/fardetectors/PolynomialMatrixReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/algorithms/tracking/TrackerHitReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/algorithms/tracking/TrackerHitReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./build/src/detectors/RPOTS/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/RPOTS/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/libalgorithms_fardetectors.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/./src/algorithms/fardetectors/FarDetectorLinearTracking.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/FarDetectorLinearTracking.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/FarDetectorLinearTrackingConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/./build/src/algorithms/fardetectors/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/./src/algorithms/fardetectors/FarDetectorTrackerCluster.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/FarDetectorTrackerCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/FarDetectorTrackerClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/./src/algorithms/fardetectors/FarDetectorTransportationPostML.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/FarDetectorTransportationPostML.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/./src/services/particle/ParticleSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/FarDetectorTransportationPostMLConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/./src/algorithms/fardetectors/FarDetectorTransportationPreML.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/FarDetectorTransportationPreML.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/FarDetectorTransportationPreMLConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/./src/algorithms/fardetectors/MatrixTransferStatic.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/MatrixTransferStatic.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/MatrixTransferStaticConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/./src/algorithms/fardetectors/PolynomialMatrixReconstruction.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/PolynomialMatrixReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/fardetectors/PolynomialMatrixReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/FOFFMTRK.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/detectors/FOFFMTRK/FOFFMTRK.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/factories/digi/SiliconTrackerDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/factories/tracking/TrackerHitReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/factories/fardetectors/MatrixTransferStatic_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/algorithms/fardetectors/MatrixTransferStaticConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/algorithms/digi/SiliconTrackerDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/algorithms/digi/SiliconTrackerDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/algorithms/fardetectors/MatrixTransferStatic.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/algorithms/tracking/TrackerHitReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/algorithms/tracking/TrackerHitReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./build/src/detectors/FOFFMTRK/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/FOFFMTRK/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/BTOF.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/detectors/BTOF/BTOF.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/digi/CFDROCDigitization.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/factories/digi/CFDROCDigitization_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/factories/reco/LGADHitCalibration_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/factories/tracking/LGADHitClustering_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/factories/digi/SiliconPulseDiscretization_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/factories/digi/SiliconChargeSharing_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/factories/digi/SiliconTrackerDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/factories/tracking/TrackerHitReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/factories/digi/PulseGeneration_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/factories/digi/PulseCombiner_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/digi/SiliconChargeSharingConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/tracking/LGADHitClusteringConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/digi/PulseGenerationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/digi/PulseCombinerConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/digi/PulseGeneration.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/reco/LGADHitCalibration.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/reco/LGADHitCalibrationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/tracking/LGADHitClustering.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/digi/SiliconChargeSharing.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/digi/PulseCombiner.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/digi/CFDROCDigitizationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/digi/SiliconTrackerDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/digi/SiliconTrackerDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/digi/SiliconPulseDiscretizationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/tracking/TrackerHitReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/tracking/TrackerHitReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/algorithms/digi/SiliconPulseDiscretization.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./build/src/detectors/BTOF/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/BTOF/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/ECTOF.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/detectors/ECTOF/ECTOF.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/digi/EICROCDigitization.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/factories/tracking/LGADHitClustering_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/factories/digi/SiliconPulseDiscretization_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/factories/digi/SiliconChargeSharing_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/factories/digi/SiliconTrackerDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/factories/tracking/TrackerHitReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/factories/digi/PulseGeneration_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/factories/digi/PulseCombiner_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/factories/digi/EICROCDigitization_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/digi/SiliconChargeSharingConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/tracking/LGADHitClusteringConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/digi/PulseGenerationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/digi/PulseCombinerConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/digi/PulseGeneration.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/tracking/LGADHitClustering.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/digi/SiliconChargeSharing.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/digi/PulseCombiner.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/digi/EICROCDigitizationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/digi/SiliconTrackerDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/digi/SiliconTrackerDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/digi/SiliconPulseDiscretizationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/tracking/TrackerHitReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/tracking/TrackerHitReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/algorithms/digi/SiliconPulseDiscretization.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./build/src/detectors/ECTOF/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/ECTOF/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/LOWQ2.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/detectors/LOWQ2/LOWQ2.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/meta/SubDivideCollection.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/meta/CollectionCollector.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/factories/digi/PulseNoise_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/factories/digi/SiliconChargeSharing_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/factories/digi/PulseGeneration_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/factories/digi/PulseCombiner_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/factories/digi/SiliconTrackerDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/factories/tracking/TrackerHitReconstruction_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/factories/fardetectors/FarDetectorTransportationPreML_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/factories/fardetectors/FarDetectorTransportationPostML_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/digi/SiliconChargeSharingConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/fardetectors/FarDetectorTrackerClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/digi/PulseGenerationConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/digi/PulseCombinerConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/meta/SubDivideCollectionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/fardetectors/FarDetectorLinearTrackingConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/onnx/ONNXInferenceConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/meta/SubDivideFunctors.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/factories/meta/CollectionCollector_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/factories/meta/ONNXInference_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/factories/fardetectors/FarDetectorTrackerCluster_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/factories/meta/SubDivideCollection_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/digi/PulseGeneration.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/factories/fardetectors/FarDetectorLinearTracking_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/digi/SiliconChargeSharing.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/digi/PulseCombiner.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/fardetectors/FarDetectorTrackerCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/fardetectors/FarDetectorLinearTracking.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/fardetectors/FarDetectorTransportationPreML.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/fardetectors/FarDetectorTransportationPreMLConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/onnx/ONNXInference.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/fardetectors/FarDetectorTransportationPostML.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/fardetectors/FarDetectorTransportationPostMLConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/digi/SiliconTrackerDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/digi/SiliconTrackerDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/tracking/TrackerHitReconstructionConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/digi/PulseNoiseConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/tracking/TrackerHitReconstruction.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/algorithms/digi/PulseNoise.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./build/src/detectors/LOWQ2/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LOWQ2/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/LUMISPECCAL.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/detectors/LUMISPECCAL/LUMISPECCAL.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/algorithms/calorimetry/CalorimeterClusterRecoCoG.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/algorithms/interfaces/UniqueIDGenSvc.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/algorithms/calorimetry/CalorimeterClusterShape.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/extensions/jana/JOmniFactory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/factories/calorimetry/CalorimeterHitDigi_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/factories/calorimetry/CalorimeterHitReco_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/factories/calorimetry/CalorimeterTruthClustering_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/factories/calorimetry/CalorimeterIslandCluster_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/factories/calorimetry/CalorimeterClusterRecoCoG_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/factories/calorimetry/CalorimeterClusterShape_factory.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/extensions/jana/JOmniFactoryGeneratorT.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/algorithms/calorimetry/CalorimeterClusterRecoCoGConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/algorithms/calorimetry/CalorimeterClusterShapeConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/algorithms/calorimetry/CalorimeterIslandClusterConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/algorithms/calorimetry/CalorimeterHitRecoConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/algorithms/calorimetry/CalorimeterHitDigiConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/algorithms/calorimetry/CalorimeterTruthClustering.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/algorithms/interfaces/WithPodConfig.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/algorithms/calorimetry/CalorimeterIslandCluster.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/algorithms/calorimetry/CalorimeterHitReco.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/algorithms/calorimetry/CalorimeterHitDigi.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./build/src/detectors/LUMISPECCAL/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/services/algorithms_init/AlgorithmsInit_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/detectors/LUMISPECCAL/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/podio.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/io/podio/./src/services/io/podio/JEventProcessorManagedPODIO.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/io/podio/JEventProcessorPODIO.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/io/podio/JEventSourceManagedPODIO.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/io/podio/./build/src/services/io/podio/<built-in>
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/io/podio/JEventProcessorManagedPODIO.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/io/podio/./src/services/log/Log_service.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/io/podio/./src/services/io/podio/JEventProcessorPODIO.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/io/podio/JEventSourcePODIO.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/io/podio/./src/services/io/podio/JEventSourceManagedPODIO.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/io/podio/./src/services/io/podio/JEventSourcePODIO.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/io/podio/datamodel_glue.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/services/io/podio/./src/services/io/podio/podio.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols/janatop.so.debug:
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/utilities/janatop/./src/utilities/janatop/janatop.cc
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/utilities/janatop/JEventProcessorJANATOP.h
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/utilities/janatop/./build/src/utilities/janatop/<built-in>
```

Particularly:

```bash
(gdb) pipe info sources | tr ',' '\n' | grep '/root/.spack/debug-sources/' | grep -iE 'TrackState|CombinatorialKalman|MultiTrajectory|MeasurementSelector|CKFTracking'
/root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/CKFTracking.cc
 /root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/CKFTracking.h
 /root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/CKFTrackingConfig.h
 /root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/algorithms/tracking/./src/algorithms/tracking/CKFTrackingFunction.cc
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackStateProxyConcept.hpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/MultiTrajectory.hpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/EventData/TrackStatePropMask.cpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackStatePropMask.hpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/EventData/VectorMultiTrajectory.cpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/VectorMultiTrajectory.hpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackStateProxyConcept.hpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackStateType.hpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/MultiTrajectory.hpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackStateProxyCommon.hpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/TrackStateProxy.hpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/include/Acts/EventData/TrackStateProxy.ipp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFinding/CombinatorialKalmanFilterError.cpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFinding/CombinatorialKalmanFilterError.hpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/./Core/src/TrackFinding/MeasurementSelector.cpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/TrackFinding/MeasurementSelector.hpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/AnyTrackStateProxy.hpp
 /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/Core/include/Acts/EventData/MultiTrajectoryHelpers.hpp
 /root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/factories/tracking/CKFTracking_factory.h
 /root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/CKFTrackingConfig.h
 /root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/src/global/tracking/./src/algorithms/tracking/CKFTracking.h
```

This returns `CKFTracking.cc/.h`, `MultiTrajectory.hpp/.cpp`, `TrackStateProxy.hpp/.ipp`, `MeasurementSelector.hpp/.cpp`, and related headers, confirming every source file touched by the backtrace was correctly staged and remapped.