const { syncDB } = require("../../tasks/sync-db")

describe('pruebas en sync-db', () => {
    test('debe Ejecutar el proceso 2 veces', () => {
        syncDB();
        const times = syncDB();
        console.log("Se llamo ", times);

        expect(times).toBe(2);
    })
})