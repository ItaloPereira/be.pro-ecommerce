const state = {
    list: [
        { _id: 1, name: 'Category 1' },
        { _id: 2, name: 'Category 2' },
        { _id: 3, name: 'Category 3' }
    ]
}

const mutations = {
    //
}

const actions = {

}

const getters = {
    categories: state => state.list
}

export default { state, mutations, actions, getters }
