
# List of HIP runtime API functions supported by chipStar

## **1. Device Management**

|   **CUDA**                                                |   **HIP**                         |  **chipStar**|
|-----------------------------------------------------------|-----------------------------------|:----------------:|

## DEVICE API

| `cudaChooseDevice`                                        | `hipChooseDevice`                 | Y |
| `cudaDeviceGetAttribute`                                  | `hipDeviceGetAttribute`           | Y |
| `cudaDeviceGetByPCIBusId`                                 | `hipDeviceGetByPCIBusId`          | Y |
| `cudaDeviceGetCacheConfig`                                | `hipDeviceGetCacheConfig`         | Y |
| `cudaDeviceGetLimit`                                      | `hipDeviceGetLimit`               | Y* |

| `cudaDeviceGetPCIBusId`                                   | `hipDeviceGetPCIBusId`            | Y |
| `cudaDeviceGetSharedMemConfig`                            | `hipDeviceGetSharedMemConfig`     | N |
| `cudaDeviceGetStreamPriorityRange`                        | `hipDeviceGetStreamPriorityRange` | Y |
| `cudaDeviceReset`                                         | `hipDeviceReset`                  | Y |
| `cudaDeviceSetCacheConfig`                                | `hipDeviceSetCacheConfig`         | Y |

| `cudaDeviceSetLimit`                                      | `hipDeviceSetLimit`               | Y |
| `cudaDeviceSetSharedMemConfig`                            | `hipDeviceSetSharedMemConfig`     | N |
| `cudaDeviceSynchronize`                                   | `hipDeviceSynchronize`            | Y |
| `cudaGetDevice`                                           | `hipGetDevice`                    | Y |
| `cudaGetDeviceCount`                                      | `hipGetDeviceCount`               | Y |

| `cudaGetDeviceFlags`                                      | `hipGetDeviceFlags`               | N |
| `cudaGetDeviceProperties`                                 | `hipGetDeviceProperties`          | Y |
| `cudaSetDevice`                                           | `hipSetDevice`                    | Y |
| `cudaSetDeviceFlags`                                      | `hipSetDeviceFlags`               | N |
| `cudaThreadSynchronize`                                   | `hipDeviceSynchronize`            | Y |

| `cudaThreadExit`                                          | `hipDeviceReset`                  | Y |
| `cudaThreadGetCacheConfig`                                | `hipDeviceGetCacheConfig`         | N |
| `cudaThreadSetCacheConfig`                                | `hipDeviceSetCacheConfig`         | N |


############## IPC API

| `cudaIpcCloseMemHandle`                                   | `hipIpcCloseMemHandle`            | N |
| `cudaIpcGetEventHandle`                                   | `hipIpcGetEventHandle`            | N |
| `cudaIpcGetMemHandle`                                     | `hipIpcGetMemHandle`              | N |
| `cudaIpcOpenEventHandle`                                  | `hipIpcOpenEventHandle`           | N |
| `cudaIpcOpenMemHandle`                                    | `hipIpcOpenMemHandle`             | N |

## **3. Error Handling**

|   **CUDA**                                                |   **HIP**                     |  **chipStar**|
|-----------------------------------------------------------|-------------------------------|:----------------:|
| `cudaGetErrorName`                                        | `hipGetErrorName`             | Y |
| `cudaGetErrorString`                                      | `hipGetErrorString`           | Y |
| `cudaGetLastError`                                        | `hipGetLastError`             | Y |
| `cudaPeekAtLastError`                                     | `hipPeekAtLastError`          | Y |

## **4. Stream Management**

|   **CUDA**                                                |   **HIP**                     |  **chipStar**   |
|-----------------------------------------------------------|-------------------------------|:----------------:|
| `cudaStreamAddCallback`                                   | `hipStreamAddCallback`        | Y |
| `cudaStreamCreate`                                        | `hipStreamCreate`             | Y |
| `cudaStreamCreateWithFlags`                               | `hipStreamCreateWithFlags`    | Y |
| `cudaStreamCreateWithPriority`                            | `hipStreamCreateWithPriority` | Y |
| `cudaStreamDestroy`                                       | `hipStreamDestroy`            | Y |

| `cudaStreamGetFlags`                                      | `hipStreamGetFlags`           | Y |
| `cudaStreamGetPriority`                                   | `hipStreamGetPriority`        | Y |
| `cudaStreamQuery`                                         | `hipStreamQuery`              | Y |
| `cudaStreamSynchronize`                                   | `hipStreamSynchronize`        | Y |
| `cudaStreamWaitEvent`                                     | `hipStreamWaitEvent`          | Y |

## **5. Event Management**

|   **CUDA**                                                |   **HIP**                     |  **chipStar**   |
|-----------------------------------------------------------|-------------------------------|:----------------:|
| `cudaEventCreate`                                         | `hipEventCreate`              | Y |
| `cudaEventCreateWithFlags`                                | `hipEventCreateWithFlags`     | Y |
| `cudaEventDestroy`                                        | `hipEventDestroy`             | Y |
| `cudaEventElapsedTime`                                    | `hipEventElapsedTime`         | Y |
| `cudaEventQuery`                                          | `hipEventQuery`               | Y |
| `cudaEventRecord`                                         | `hipEventRecord`              | Y |
| `cudaEventSynchronize`                                    | `hipEventSynchronize`         | Y |


## **7. Execution Control**

|   **CUDA**                                                |   **HIP**                             |  **chipStar**   |
|-----------------------------------------------------------|---------------------------------------|:----------------:|
| `cudaFuncGetAttributes`                                   |`hipFuncGetAttributes`                 | Y*|
| `cudaFuncSetAttribute`                                    |`hipFuncSetAttribute`                  | Y |
| `cudaFuncSetCacheConfig`                                  |`hipFuncSetCacheConfig`                | Y* |
| `cudaFuncSetSharedMemConfig`                              |`hipFuncSetSharedMemConfig`            | N |
| `cudaLaunchKernel`                                        |`hipLaunchKernel`                      | Y |

| `cudaLaunchCooperativeKernel`                             |`hipLaunchCooperativeKernel`           | N    |
| `cudaLaunchCooperativeKernelMultiDevice`                  |`hipLaunchCooperativeKernelMultiDevice`| N    |
| `cudaConfigureCall`                                       | `hipConfigureCall`                    | Y |
| `cudaLaunch`                                              | `hipLaunchByPtr`                      | Y |
| `cudaSetupArgument`                                       | `hipSetupArgument`                    | Y |

## **8. Occupancy**

|   **CUDA**                                                |   **HIP**                                             |  **chipStar**|
|-----------------------------------------------------------|-------------------------------------------------------|:----------------:|
| `cudaOccupancyMaxActiveBlocksPerMultiprocessor`           | `hipOccupancyMaxActiveBlocksPerMultiprocessor`         | N |
| `cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags`  | `hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags`| N |
| ?                                                         | `hipModuleOccupancyMaxPotentialBlockSize`              | N |
| ?                                                         | `hipModuleOccupancyMaxPotentialBlockSizeWithFlags`     | N |
| ?                                                         | `hipModuleOccupancyMaxActiveBlocksPerMultiprocessor`   | N |
| ?                                                         | `hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags`  N |
| ?                                                         | `hipOccupancyMaxPotentialBlockSize`                    | N |


## **9. Memory Management**

|   **CUDA**                                                |   **HIP**                     |  **chipStar**|
|-----------------------------------------------------------|-------------------------------|:----------------:|
| `cudaArrayGetInfo`                                        |                               | ? |
| `cudaFree`                                                | `hipFree`                     | Y |
| `cudaFreeArray`                                           | `hipFreeArray`                | Y |
| `cudaFreeHost`                                            | `hipHostFree`                 | Y |
| `cudaGetSymbolAddress`                                    | `hipGetSymbolAddress`         | Y |

| `cudaGetSymbolSize`                                       | `hipGetSymbolSize`            | Y |
| `cudaHostAlloc`                                           | `hipHostMalloc`               | Y |
| `cudaHostGetDevicePointer`                                | `hipHostGetDevicePointer`     | Y |
| `cudaHostGetFlags`                                        | `hipHostGetFlags`             | Y |
| `cudaHostRegister`                                        | `hipHostRegister`             | Y |

| `cudaHostUnregister`                                      | `hipHostUnregister`           | Y |
| `cudaMalloc`                                              | `hipMalloc`                   | Y |
| `cudaMalloc3D`                                            | `hipMalloc3D`                 | Y |
| `cudaMalloc3DArray`                                       | `hipMalloc3DArray`            | Y |
| `cudaMallocArray`                                         | `hipMallocArray`              | Y |

| `cudaMallocHost`                                          | `hipHostMalloc`               | Y |
| `cudaMallocManaged`                                       | `hipMallocManaged`            | Y |
| `cudaMemGetInfo`                                          | `hipMemGetInfo`               | Y |
| `cudaMemcpy`                                              | `hipMemcpy`                   | Y |
| `cudaMemcpy2D`                                            | `hipMemcpy2D`                 | Y |

| `cudaMemcpy2DAsync`                                       | `hipMemcpy2DAsync`            | Y |
| `cudaMemcpy2DFromArray`                                   | `hipMemcpy2DFromArray`        | Y |
| `cudaMemcpy2DFromArrayAsync`                              | `hipMemcpy2DFromArrayAsync`   | Y |
| `cudaMemcpy2DToArray`                                     | `hipMemcpy2DToArray`          | Y |
| `cudaMemcpy3D`                                            | `hipMemcpy3D`                 | Y |

| `cudaMemcpy3DAsync`                                       | `hipMemcpy3DAsync`            | Y |
| `cudaMemcpyAsync`                                         | `hipMemcpyAsync`              | Y |
| `cudaMemcpyFromSymbol`                                    | `hipMemcpyFromSymbol`         | Y |
| `cudaMemcpyFromSymbolAsync`                               | `hipMemcpyFromSymbolAsync`    | Y |
| `cudaMemcpyPeer`                                          | `hipMemcpyPeer`               | N |

| `cudaMemcpyPeerAsync`                                     | `hipMemcpyPeerAsync`          | N |
| `cudaMemcpyToSymbol`                                      | `hipMemcpyToSymbol`           | Y |
| `cudaMemcpyToSymbolAsync`                                 | `hipMemcpyToSymbolAsync`      | Y |
| `cudaMemset`                                              | `hipMemset`                   | Y |
| `cudaMemset2D`                                            | `hipMemset2D`                 | Y |

| `cudaMemset2DAsync`                                       | `hipMemset2DAsync`            | Y |
| `cudaMemset3D`                                            | `hipMemset3D`                 | Y |
| `cudaMemset3DAsync`                                       | `hipMemset3DAsync`            | Y |
| `cudaMemsetAsync`                                         | `hipMemsetAsync`              | Y |
| `make_cudaExtent`                                         | `make_hipExtent`              | Y |

| `make_cudaPitchedPtr`                                     | `make_hipPitchedPtr`          | Y |
| `make_cudaPos`                                            | `make_hipPos`                 | Y |
| `cudaMemcpyFromArray`                                     | `hipMemcpyFromArray`          | Y |
| `cudaMemcpyToArray`                                       | `hipMemcpyToArray`            | Y |

| ?                                                         | `hipMemPrefetchAsync`         | N |
| ?                                                         | `hipMemAdvise`                | N |
| ?                                                         | `hipMemRangeGetAttribute`     | N |

## **11. Unified Addressing**

|   **CUDA**                                                |   **HIP**                     |  **chipStar**|
|-----------------------------------------------------------|-------------------------------|:----------------:|
| `cudaPointerGetAttributes`                                | `hipPointerGetAttributes`     | Y |

## **12. Peer Device Memory Access**

|   **CUDA**                                                |   **HIP**                     |  **chipStar**|
|-----------------------------------------------------------|-------------------------------|:----------------:|
| `cudaDeviceCanAccessPeer`                                 | `hipDeviceCanAccessPeer`      | N |
| `cudaDeviceDisablePeerAccess`                             | `hipDeviceDisablePeerAccess`  | N |
| `cudaDeviceEnablePeerAccess`                              | `hipDeviceEnablePeerAccess`   | N |

## **24. Texture Reference Management [DEPRECATED]**

|   **CUDA**                                                |   **HIP**                        |  **chipStar**|
|-----------------------------------------------------------|----------------------------------|:----------------:|
| `cudaBindTexture`                                         | `hipBindTexture`                 | Y |
| `cudaBindTexture2D`                                       | `hipBindTexture2D`               | Y |
| `cudaBindTextureToArray`                                  | `hipBindTextureToArray`          | Y |
| `cudaBindTextureToMipmappedArray`                         | `hipBindTextureToMipmappedArray` | Y |
| `cudaCreateChannelDesc`                                   | `hipCreateChannelDesc`           | Y |

| `cudaGetChannelDesc`                                      | `hipGetChannelDesc`              | Y |
| `cudaGetTextureAlignmentOffset`                           | `hipGetTextureAlignmentOffset`   | Y |
| `cudaGetTextureReference`                                 | `hipGetTextureReference`         | Y |
| `cudaUnbindTexture`                                       | `hipUnbindTexture`               | Y |

## **26. Texture Object Management**

|   **CUDA**                                                |   **HIP**                            |  **chipStar**|
|-----------------------------------------------------------|--------------------------------------|:----------------:|
| `cudaCreateTextureObject`                                 |`hipCreateTextureObject`              | Y |
| `cudaDestroyTextureObject`                                |`hipDestroyTextureObject`             | Y |
| `cudaGetTextureObjectResourceDesc`                        |`hipGetTextureObjectResourceDesc`     | Y |
| `cudaGetTextureObjectResourceViewDesc`                    |`hipGetTextureObjectResourceViewDesc` | N |
| `cudaGetTextureObjectTextureDesc`                         |`hipGetTextureObjectTextureDesc`      | N |

## **27. Surface Object Management**

|   **CUDA**                                                |   **HIP**                     |  **chipStar**|
|-----------------------------------------------------------|-------------------------------|:----------------:|
| `cudaCreateSurfaceObject`                                 | `hipCreateSurfaceObject`      | N |
| `cudaDestroySurfaceObject`                                | `hipDestroySurfaceObject`     | N |

## **28. Version Management**

|   **CUDA**                                                |   **HIP**                     |  **chipStar**|
|-----------------------------------------------------------|-------------------------------|:----------------:|
| `cudaDriverGetVersion`                                    | `hipDriverGetVersion`         | Y |
| `cudaRuntimeGetVersion`                                   | `hipRuntimeGetVersion`        | Y |

## **29. Graph Management**

|   **CUDA**                                                |   **HIP**                     |  **chipStar**|
|-----------------------------------------------------------|-------------------------------|:----------------:|
| `cudaGraphAddChildGraphNode`                              |  hipGraphAddChildGraphNode    | Y                |
| `cudaGraphAddDependencies`                                |  hipGraphAddDependencies      | Y                |
| `cudaGraphAddEmptyNode`                                   |  hipGraphAddEmptyNode         | Y                |
| `cudaGraphAddHostNode`                                    |  hipGraphAddHostNode          | Y                |
| `cudaGraphAddKernelNode`                                  |  hipGraphAddKernelNode        | Y                |

| `cudaGraphAddMemcpyNode`                                  |  hipGraphAddMemcpyNode        | Y                |
| `cudaGraphAddMemsetNode`                                  |  hipGraphAddMemsetNode        | Y                |
| `cudaGraphChildGraphNodeGetGraph`                         |  hipGraphChildGraphNodeGetGraph | Y              |
| `cudaGraphClone`                                          |  hipGraphClone                | Y                |
| `cudaGraphCreate`                                         |  hipGraphCreate               | Y                |

| `cudaGraphDestroy`                                        |  hipGraphDestroy              | Y                |
| `cudaGraphDestroyNode`                                    |  hipGraphCreate               | Y                |
| `cudaGraphExecDestroy`                                    |  hipGraphExecDestroy          | Y                |
| `cudaGraphGetEdges`                                       |  hipGraphGetEdges             | Y                |
| `cudaGraphGetNodes`                                       |  hipGraphGetNodes             | Y                |

| `cudaGraphGetRootNodes`                                   |  hipGraphGetRootNodes         | Y                |
| `cudaGraphHostNodeGetParams`                              |  hipGraphHostNodeGetParams    | Y                |
| `cudaGraphHostNodeSetParams`                              |  hipGraphHostNodeSetParams    | Y                |
| `cudaGraphInstantiate`                                    |  hipGraphInstantiate          | Y                |
| `cudaGraphExecKernelNodeSetParams`                        |  hipGraphExecKernelNodeSetParams  | Y            |

| `cudaGraphExecMemcpyNodeSetParams`                        |  hipGraphExecMemcpyNodeSetParams  | Y            |
| `cudaGraphExecMemsetNodeSetParams`                        |  hipGraphExecMemsetNodeSetParams  | Y            |
| `cudaGraphExecHostNodeSetParams`                          |  hipGraphExecHostNodeSetParams  | Y              |
| `cudaGraphExecUpdate`                                     |  hipGraphExecUpdate           | Y                |
| `cudaGraphKernelNodeGetParams`                            |  hipGraphKernelNodeGetParams  | Y                |

| `cudaGraphKernelNodeSetParams`                            |  hipGraphKernelNodeSetParams  | Y                |
| `cudaGraphLaunch`                                         |  hipGraphLaunch               | Y                |
| `cudaGraphMemcpyNodeGetParams`                            |  hipGraphMemcpyNodeGetParams  | Y                |
| `cudaGraphMemcpyNodeSetParams`                            |  hipGraphMemcpyNodeSetParams  | Y                |
| `cudaGraphMemsetNodeGetParams`                            |  hipGraphMemsetNodeGetParams  | Y                |

| `cudaGraphMemsetNodeSetParams`                            |  hipGraphMemsetNodeSetParams  | Y                |
| `cudaGraphNodeFindInClone`                                |  hipGraphNodeFindInClone      | Y                |
| `cudaGraphNodeGetDependencies`                            |  hipGraphNodeGetDependencies  | Y                |
| `cudaGraphNodeGetDependentNodes`                          |  hipGraphNodeGetDependentNodes  | Y              |
| `cudaGraphNodeGetType`                                    |  hipGraphNodeGetType          | Y                |

| `cudaGraphRemoveDependencies`                             |  hipGraphRemoveDependencies   | Y                |

... INCOMPLETE, there are 55 Graph API functions in CHIPBindings.cc


## **32. Profiler Control**

|   **CUDA**                                                |   **HIP**                     |  **chipStar**|
|-----------------------------------------------------------|-------------------------------|:----------------:|
| `cudaProfilerStart`                                       | `hipProfilerStart`            | N |
| `cudaProfilerStop`                                        | `hipProfilerStop`             | N |


#### Primary Context API

|   **CUDA**                                                |   **HIP**                     |  **chipStar**|
|-----------------------------------------------------------|-------------------------------|:----------------:|
| ?                                                         | `hipDevicePrimaryCtxGetState` | Y        |
| ?                                                         | `hipDevicePrimaryCtxRelease`  | N        |
| ?                                                         | `hipDevicePrimaryCtxRetain`   | N        |
| ?                                                         | `hipDevicePrimaryCtxReset`    | Y        |
| ?                                                         | `hipDevicePrimaryCtxSetFlags` | N        |


#### Module API

|   **CUDA**                                                |   **HIP**                     |  **chipStar**|
|-----------------------------------------------------------|-------------------------------|:----------------:|
| ?                                                         | `hipModuleLoadData`           | Y        |
| ?                                                         | `hipModuleUnload`             | Y        |
| ?                                                         | `hipModuleLaunchKernel`       | Y*       |

* partially supported (with some caveats)
