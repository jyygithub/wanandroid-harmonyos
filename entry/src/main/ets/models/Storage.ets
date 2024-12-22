// Storage.ets
@ObservedV2
export class MyStorage {
  static singleton_: MyStorage;

  static instance() {
    if (!MyStorage.singleton_) {
      MyStorage.singleton_ = new MyStorage();
    }
    ;
    return MyStorage.singleton_;
  }

  @Trace cookies: string = '';
}