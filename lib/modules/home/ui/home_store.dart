import 'package:mobx/mobx.dart';
import '../../../core/services/local_storage/local_storage_service.dart';
import '../../../models/condominium_model.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final ILocalStorageService _storage;

  _HomeStoreBase(this._storage) {
    fetchCondominiums();
  }

  @observable
  ObservableList<Condominium> condominiums = ObservableList<Condominium>();

  @observable
  bool isLoading = false;

  @action
  void fetchCondominiums() {
    isLoading = true;
    final mockData = [
      Condominium(id: '1', name: 'Residencial das Flores', address: 'Rua das Palmeiras, 123'),
      Condominium(id: '2', name: 'Condomínio Vista Verde', address: 'Avenida das Árvores, 456'),
      Condominium(id: '3', name: 'Parque dos Passaros', address: 'Alameda dos Sabiás, 789'),
      Condominium(id: '4', name: 'Edifício Central', address: 'Praça da Matriz, 101'),
      Condominium(id: '5', name: 'Solar das Acácias', address: 'Rua do Sol, 202'),
    ];

    final favoriteIds = _storage.getStringList('favorite_condos');

    for (var condo in mockData) {
      if (favoriteIds.contains(condo.id)) {
        condo.setFavorite(true);
      }
    }

    mockData.sort((a, b) => b.isFavorite ? 1 : -1);

    condominiums.addAll(mockData);
    isLoading = false;
  }

  @action
  Future<void> toggleFavorite(Condominium condo) async {
    condo.setFavorite(!condo.isFavorite);

    final favoriteIds = _storage.getStringList('favorite_condos');
    if (condo.isFavorite) {
      favoriteIds.add(condo.id);
    } else {
      favoriteIds.remove(condo.id);
    }
    await _storage.setStringList('favorite_condos', favoriteIds);

    if (condo.isFavorite) {
      condominiums.remove(condo);
      condominiums.insert(0, condo);
    }
  }
}